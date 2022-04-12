//
//  EditView.swift
//  Bucketlist
//
//  Created by Nikolaj Søgaard Mosbæk Nielsen on 03/03/2022.
//

import SwiftUI

struct EditView: View {
	@Environment(\.dismiss) var dismiss
	@StateObject private var viewModel: ViewModel
	
	var onSave: (Location) -> Void
	
    var body: some View {
		NavigationView {
			Form {
				Section {
					TextField("Place name", text: $viewModel.name)
					TextField("Description", text: $viewModel.description)
				}
				
				Section("Nearby") {
					switch viewModel.loadingState {
					case .loading:
						Text("Loading")
					case .loaded:
						ForEach(viewModel.pages, id: \.pageid) { page in
							Text(page.title)
								.font(.headline)
							+ Text(": ")
							+ Text(page.description)
								.italic()
						}
					case .failed:
						Text("Please try again later")
					}
				}
			}
			.navigationTitle("Place details")
			.toolbar {
				Button("Save") {
					let newLocation = viewModel.updateLocation()
					
					onSave(newLocation)
					dismiss()
				}
			}
			.task {
				await viewModel.fetchNearbyPlaces()
			}
		}
    }
	
	init(location: Location, onSave: @escaping (Location) -> Void) {
		self.onSave = onSave
		
		_viewModel = StateObject(wrappedValue: ViewModel(location: location))
	}
	
	
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
		EditView(location: Location.example) { _ in }
    }
}
