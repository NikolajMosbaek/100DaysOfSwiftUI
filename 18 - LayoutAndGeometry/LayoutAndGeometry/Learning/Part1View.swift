//
//  Part1View.swift
//  LayoutAndGeometry
//
//  Created by Nikolaj Søgaard Simonsen on 21/04/2022.
//

import SwiftUI

struct Part1View: View {
    var body: some View {
		VStack(alignment: .leading) {
			ForEach(0..<10) { position in
				Text("Number \(position)")
					.alignmentGuide(.leading) { _ in
						Double(position) * -10
					}
			}
			
//			Text("Hello, World!")
//				.alignmentGuide(.leading) { d in
//					d[.trailing]
//				}
//
//			Text("This is a longer line of text")
		}
		.background(.red)
		.frame(width: 400, height: 400)
		.background(.blue)
    }
}

struct Part1View_Previews: PreviewProvider {
    static var previews: some View {
        Part1View()
    }
}
