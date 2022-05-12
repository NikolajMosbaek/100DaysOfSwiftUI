//
//  Part1View.swift
//  SnowSeeker
//
//  Created by Nikolaj Søgaard Simonsen on 27/04/2022.
//

import SwiftUI

struct Part1View: View {
    var body: some View {
		NavigationView {
			NavigationLink {
				Text("New secondary")
			} label: {
				Text("Hello, World!")
			}
			.navigationTitle("Primary")
			
			Text("Secondary")
			
			Text("Tertiary")
		}
    }
}

struct Part1View_Previews: PreviewProvider {
    static var previews: some View {
        Part1View()
    }
}
