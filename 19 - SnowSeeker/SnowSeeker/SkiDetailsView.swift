//
//  SkiDetailsView.swift
//  SnowSeeker
//
//  Created by Nikolaj Søgaard Simonsen on 27/04/2022.
//

import SwiftUI

struct SkiDetailsView: View {
	let resort: Resort
	
    var body: some View {
		Group {
			VStack {
				Text("Elevation")
					.font(.caption.bold())
				Text("\(resort.elevation)m")
					.font(.title3)
			}
			
			VStack {
				Text("Snow")
					.font(.caption.bold())
				Text("\(resort.snowDepth)")
					.font(.title3)
			}
		}
		.frame(maxWidth: .infinity)
    }
}

struct SkiDetailsView_Previews: PreviewProvider {
    static var previews: some View {
		SkiDetailsView(resort: Resort.example)
    }
}
