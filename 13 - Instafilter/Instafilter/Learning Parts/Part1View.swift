//
//  Part1View.swift
//  Instafilter
//
//  Created by Nikolaj Søgaard Mosbæk Nielsen on 25/02/2022.
//

import SwiftUI

struct Part1View: View {
	@State private var blurAmount = 0.0
	
    var body: some View {
		VStack {
			Text("Hello Wold")
				.blur(radius: blurAmount)
			
			Slider(value: $blurAmount, in: 0...20)
				.onChange(of: blurAmount) { newValue in
					print("New value is \(newValue)")
				}
			
			Button("Random blur") {
				blurAmount = Double.random(in: 0...20)
			}
		}
    }
}

struct Part1View_Previews: PreviewProvider {
    static var previews: some View {
        Part1View()
    }
}
