//
//  ResortView.swift
//  SnowSeeker
//
//  Created by Nikolaj Søgaard Simonsen on 27/04/2022.
//

import SwiftUI

struct ResortView: View {
	let resort: Resort
	
	@Environment(\.horizontalSizeClass) var sizeClass
	@Environment(\.dynamicTypeSize) var typeSize
	
	@EnvironmentObject var favorites: Favorites
	
	@State private var selectedFacility: Facility?
	@State private var showingFacility = false
	
    var body: some View {
		ScrollView {
			VStack(alignment: .leading, spacing: 0) {
				Text("Photo by: \(resort.imageCredit)")
					.font(.caption)
					.foregroundColor(.secondary)
					.padding(.horizontal)
				
				Image(decorative: resort.id)
					.resizable()
					.scaledToFit()
				
				HStack {
					if sizeClass == .compact && typeSize > .large {
						VStack(spacing: 10) { ResortDetailsView(resort: resort) }
						VStack(spacing: 10) { SkiDetailsView(resort: resort) }
					} else {
						ResortDetailsView(resort: resort)
						SkiDetailsView(resort: resort)
					}
				}
				.padding(.vertical)
				.background(Color.primary.opacity(0.1))
				.dynamicTypeSize(...DynamicTypeSize.xxxLarge) // Supports UI up to and including typeSixe xxxLarge
				
				Group {
					Text(resort.description)
						.padding(.vertical)
					
					Text("Facilities")
						.font(.headline)
					
					HStack {
						ForEach(resort.facilityTypes) { facility in
							Button {
								selectedFacility = facility
								showingFacility = true
							} label: {
								facility.icon
									.font(.title)
							}
						}
					}
					
					Button(favorites.contains(resort) ? "Remove from favorites" : "Add to favorites") {
						if favorites.contains(resort) {
							favorites.remove(resort)
						} else {
							favorites.add(resort)
						}
					}
					.buttonStyle(.borderedProminent)
					.padding()
				}
				.padding(.horizontal)
			}
		}
		.navigationTitle("\(resort.name), \(resort.country)")
		.navigationBarTitleDisplayMode(.inline)
		.alert(selectedFacility?.name ?? "More information", isPresented: $showingFacility, presenting: selectedFacility) { _ in
		} message : { facility in
			Text(facility.description)
		}
    }
}

struct ResortView_Previews: PreviewProvider {
    static var previews: some View {
		NavigationView {
			ResortView(resort: Resort.example)
		}
		.environmentObject(Favorites())
    }
}
