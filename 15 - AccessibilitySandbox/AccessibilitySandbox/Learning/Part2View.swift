//
//  Part2View.swift
//  AccessibilitySandbox
//
//  Created by Nikolaj Søgaard Simonsen on 08/03/2022.
//

import SwiftUI

struct Part2View: View {
    var body: some View {
		// Hide from accessibility
//        Image(decorative: "nicolas-tissot-335096")
//			.accessibilityHidden(true)
		
		// Group for accessibility
		VStack {
			Text("Your score is")
			Text("1000")
				.font(.title)
		}
//		.accessibilityElement(children: .combine)
		.accessibilityElement(children: .ignore)
		.accessibilityLabel("Your score is 1000")
    }
}

struct Part2View_Previews: PreviewProvider {
    static var previews: some View {
        Part2View()
    }
}
