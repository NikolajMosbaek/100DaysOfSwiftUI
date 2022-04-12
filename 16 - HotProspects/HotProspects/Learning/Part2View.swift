//
//  Part2View.swift
//  HotProspects
//
//  Created by Nikolaj Søgaard Simonsen on 31/03/2022.
//

import SwiftUI

struct Part2View: View {
	@State private var selectedTab = "One"
	
    var body: some View {
		TabView(selection: $selectedTab) {
			Text("Tap 1")
				.onTapGesture {
					selectedTab = "Two"
				}
				.tabItem {
					Label("One", systemImage: "star")
				}
			Text("Tap 2")
				.tabItem {
					Label("Two", systemImage: "circle")
				}
				.tag("Two")
		}
    }
}

struct Part2View_Previews: PreviewProvider {
    static var previews: some View {
        Part2View()
    }
}
