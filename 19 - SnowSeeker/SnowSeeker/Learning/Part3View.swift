//
//  Part3View.swift
//  SnowSeeker
//
//  Created by Nikolaj Søgaard Simonsen on 27/04/2022.
//

import SwiftUI

struct UserView: View {
	var body: some View {
		Group {
			Text("Name: Nikolaj")
			Text("Country: Denmark")
			Text("Pets: Moysen and Rackham")
		}
		.font(.title)
	}
}

struct Part3View: View {
	@Environment(\.horizontalSizeClass) var sizeClass
	
    var body: some View {
		Group {
			if sizeClass == .compact {
				VStack(content: UserView.init)
			} else {
				HStack(content: UserView.init)
			}
		}
    }
}

struct Part3View_Previews: PreviewProvider {
    static var previews: some View {
        Part3View()
    }
}
