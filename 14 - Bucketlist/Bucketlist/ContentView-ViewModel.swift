//
//  ContentView-ViewModel.swift
//  Bucketlist
//
//  Created by Nikolaj Søgaard Simonsen on 03/03/2022.
//

import Foundation
import LocalAuthentication
import MapKit

extension ContentView {
	@MainActor class ViewModel: ObservableObject {
		@Published var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 50, longitude: 0), span: MKCoordinateSpan(latitudeDelta: 25, longitudeDelta: 25))
		@Published private(set) var locations: [Location]
		@Published var selectedPlace: Location?
		@Published var isUnlocked = false
		
		@Published var showAuthendicationAlert = false
		@Published var authendicationAlertMessage = ""
		
		let savedPath = FileManager.documentsDirectory.appendingPathComponent("SavedPlace")
		
		init() {
			do {
				let data = try Data(contentsOf: savedPath)
				locations = try JSONDecoder().decode([Location].self, from: data)
			} catch {
				locations = []
			}
		}
		
		func save() {
			do {
				let data = try JSONEncoder().encode(locations)
				try data.write(to: savedPath, options: [.atomicWrite, .completeFileProtection])
			} catch {
				print("Unable to save data")
			}
		}
		
		func addLocation() {
			let newLoation = Location(
				id: UUID(),
				name: "New location",
				description: "",
				latitude: mapRegion.center.latitude,
				longitude: mapRegion.center.longitude
			)
			locations.append(newLoation)
			save()
		}
		
		func updateLocation(location: Location) {
			guard let selectedPlace = selectedPlace else { return }

			if let index = locations.firstIndex(of: selectedPlace) {
				locations[index] = location
				save()
			}
		}
		
		func authendicate() {
			let context = LAContext()
			var error: NSError?
			
			if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
				let reason = "Please authendicate yourself to unlock your places."
				
				context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authendicationError in
					Task { @MainActor in
						if success {
							self.isUnlocked = true
						} else {
							self.authendicationAlertMessage = "Authendication failed"
							self.showAuthendicationAlert = true
						}
					}
				}
			} else {
				// No biometrics
			}
		}
	}
}
