//
//  ProspectsView.swift
//  HotProspects
//
//  Created by Nikolaj Søgaard Simonsen on 05/04/2022.
//

import CodeScanner
import SwiftUI
import UserNotifications

struct ProspectsView: View {
	enum FilterType {
		case none
		case contacted
		case uncontacted
	}
	
	@EnvironmentObject var prospects: Prospects
	@State private var isShowingScanner = false
	@State private var isShowingSortDialog = false
	
	let filter: FilterType
	
    var body: some View {
		NavigationView {
			List {
				ForEach(filteredProspects) { prospect in
					HStack {
						VStack(alignment: .leading) {
							Text(prospect.name)
								.font(.headline)
							Text(prospect.emailAddress)
								.foregroundColor(.secondary)
						}
						Spacer()
						if filter == .none {
							Image(systemName: prospect.isContacted ? "person.crop.circle.fill.badge.checkmark" : "person.crop.circle.badge.xmark")
								.foregroundColor(prospect.isContacted ? .green : .blue)
						}
					}
					.swipeActions {
						if prospect.isContacted {
							Button {
								prospects.toggle(prospect)
							} label: {
								Label("Mark Uncontacted", systemImage: "person.crop.circle.badge.xmark")
							}
							.tint(.blue)
						} else {
							Button {
								prospects.toggle(prospect)
							} label: {
								Label("Mark Contacted", systemImage: "person.crop.circle.fill.badge.checkmark")
							}
							.tint(.green)
							
							Button {
								addNotification(for: prospect)
							} label: {
								Label("Remind me", systemImage: "bell")
									.tint(.orange)
							}
						}
					}
				}
			}
			.navigationTitle(title)
			.toolbar {
				ToolbarItemGroup(placement: .navigationBarTrailing) {
					Button {
						isShowingScanner = true
					} label: {
						Label("Scan", systemImage: "qrcode.viewfinder")
					}
					
					Button {
						isShowingSortDialog = true
					} label: {
						Label("Sort", systemImage: "arrow.up.and.down.circle.fill")
					}
				}
			}
			.sheet(isPresented: $isShowingScanner) {
				CodeScannerView(codeTypes: [.qr],
								simulatedData: "Emil Simonsen\nemil.simonsen@capgemini.com",
								completion: handleScan)
			}
			.confirmationDialog("How would you like to sort the list?", isPresented: $isShowingSortDialog) {
				Button("By name") {
					self.prospects.sort(by: .byName)
				}
				Button("By add date") {
					self.prospects.sort(by: .byDate)
				}
			}
		}
	}
	
	var title: String {
		switch filter {
		case .none:
			return "Everyone"
		case .contacted:
			return "Contacted people"
		case .uncontacted:
			return "Uncontacted people"
		}
	}
	
	var filteredProspects: [Prospect] {
		switch filter {
		case .none:
			return prospects.people
		case .contacted:
			return prospects.people.filter { $0.isContacted }
		case .uncontacted:
			return prospects.people.filter { !$0.isContacted }
		}
	}
	
	func handleScan(result: Result<ScanResult, ScanError>) {
		isShowingScanner = false
		
		switch result {
		case .success(let result):
			let details = result.string.components(separatedBy: "\n")
			guard details.count == 2 else { return }
			
			let prospect = Prospect()
			prospect.name = details[0]
			prospect.emailAddress = details[1]
			prospects.add(prospect)
			
		case .failure(let error):
			print("Scanning failed: \(error.localizedDescription)")
		}
	}
	
	func addNotification(for prospect: Prospect) {
		let center = UNUserNotificationCenter.current()
		
		let addRequest = {
			let content = UNMutableNotificationContent()
			content.title = "Contact \(prospect.name)"
			content.subtitle = prospect.emailAddress
			content.sound = UNNotificationSound.default
			
			var dateComponents = DateComponents()
			dateComponents.hour = 9
//			let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
			let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
			
			let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
			center.add(request)
		}
		
		center.getNotificationSettings { settings in
			if settings.authorizationStatus == .authorized {
				addRequest()
			} else {
				center.requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
					if success {
						addRequest()
					} else {
						print("D'oh!")
					}
				}
			}
		}
	}
}

struct ProspectsView_Previews: PreviewProvider {
    static var previews: some View {
		ProspectsView(filter: .none)
			.environmentObject(Prospects())
    }
}
