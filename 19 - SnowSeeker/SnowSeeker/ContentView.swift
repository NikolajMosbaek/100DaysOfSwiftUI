//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Nikolaj Søgaard Simonsen on 27/04/2022.
//

import SwiftUI

extension View {
	@ViewBuilder func phoneOnlyNavigationView() -> some View {
		if UIDevice.current.userInterfaceIdiom == .phone {
			self.navigationViewStyle(.stack)
		} else {
			self
		}
	}
}

struct ContentView: View {
	let resorts: [Resort] = Bundle.main.decode("resorts.json")
	
	@StateObject var favorites = Favorites()
	@State private var searchText = ""
	@State private var order: String = "Default magic"
	
	let sortTypes = ["Alphabetic", "Country", "Default magic"]
	
    var body: some View {
		NavigationView {
			VStack {
				Picker("Order list by", selection: $order) {
					ForEach(sortTypes, id: \.self) {
						Text($0)
					}
				}
				.pickerStyle(.segmented)
				
 				List(filteredResorts) { resort in
					NavigationLink {
						ResortView(resort: resort)
					} label: {
						HStack {
							Image(resort.country)
								.resizable()
								.scaledToFill()
								.frame(width: 40, height: 25)
								.clipShape(RoundedRectangle(cornerRadius: 5))
								.overlay(
									RoundedRectangle(cornerRadius: 5)
										.stroke(.black, lineWidth: 1)
								)
							
							VStack(alignment: .leading) {
								Text(resort.name)
									.font(.headline)
								Text("\(resort.runs) runs")
									.foregroundColor(.secondary)
							}
							
							if favorites.contains(resort) {
								Spacer()
								Image(systemName: "heart.fill")
									.accessibilityLabel("This is a favorite resort")
									.foregroundColor(.red)
							}
						}
					}
				}
				.navigationTitle("Resorts")
				.searchable(text: $searchText, prompt: "Search for a resort")
			}
			
			WelcomeView()
			
		}
		.environmentObject(favorites)
	}
	
	var filteredResorts: [Resort] {
		var orderedResorts = resorts
		switch order {
		case "Alphabetic":
			orderedResorts = orderedResorts.sorted { $0.name < $1.name }
		case "Country":
			orderedResorts = orderedResorts.sorted { $0.country < $1.country }
		default:
			break
		}
		
		if searchText.isEmpty {
			return orderedResorts
		} else {
			return orderedResorts.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
		}
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
