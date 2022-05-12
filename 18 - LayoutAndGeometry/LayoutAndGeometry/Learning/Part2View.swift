//
//  Part2View.swift
//  LayoutAndGeometry
//
//  Created by Nikolaj Søgaard Simonsen on 21/04/2022.
//

import SwiftUI

extension VerticalAlignment {
	enum MidAccountAndName: AlignmentID {
		static func defaultValue(in context: ViewDimensions) -> CGFloat {
			context[.top]
		}
	}
	
	static let midAccountAndName = VerticalAlignment(MidAccountAndName.self)
}

struct Part2View: View {
	var body: some View {
		HStack(alignment: .midAccountAndName) {
			VStack {
				Text("@nikolajmosb")
					.alignmentGuide(.midAccountAndName) { d in
						d[VerticalAlignment.center]
					}
				
				Image("nikolaj-simonsen")
					.resizable()
					.frame(width: 64, height: 64)
					.scaledToFit()
			}
			
			VStack {
				Text("Full name:")
				Text("NIKOLAJ SIMONSEN")
					.alignmentGuide(.midAccountAndName) { d in
						d[VerticalAlignment.center]
					}
					.font(.largeTitle)
			}
		}
	}
}

struct Part2View_Previews: PreviewProvider {
    static var previews: some View {
        Part2View()
    }
}
