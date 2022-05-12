//
//  Part4View.swift
//  SnowSeeker
//
//  Created by Nikolaj Søgaard Simonsen on 27/04/2022.
//

import SwiftUI

struct Part4View: View {
	@State private var searchText = ""
	let allNames = ["Nikolaj", "Rikke", "Moysen", "Rackham", "Email"]
	
	var body: some View {
		NavigationView {
			List(filteredNames, id: \.self) { name in
				Text(name)
			}
			.searchable(text: $searchText, prompt: "Look for something")
			.navigationTitle("Searching")
		}
	}
	
	var filteredNames: [String] {
		if searchText.isEmpty {
			return allNames
		} else {
			return allNames.filter { $0.localizedCaseInsensitiveContains(searchText) }
		}
	}
}

struct Part4View_Previews: PreviewProvider {
	static var previews: some View {
		Part4View()
	}
}
