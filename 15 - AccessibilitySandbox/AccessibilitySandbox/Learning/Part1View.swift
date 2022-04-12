//
//  Part1View.swift
//  AccessibilitySandbox
//
//  Created by Nikolaj Søgaard Simonsen on 08/03/2022.
//

import SwiftUI

struct Part1View: View {
	let pictures = [
		"ales-krivec-15949",
		"galina-n-189483",
		"kevin-horstmann-141705",
		"nicolas-tissot-335096"
	]
	
	@State private var selectedPicture = Int.random(in: 0...3)
	
	let labels = [
		"Tulips",
		"Frozen tree buds",
		"Sunflowers",
		"Fireworks"
	]
	
    var body: some View {
		Image(pictures[selectedPicture])
			.resizable()
			.scaledToFit()
			.onTapGesture {
				selectedPicture = Int.random(in: 0...3)
			}
			.accessibilityLabel(labels[selectedPicture])
			.accessibilityAddTraits(.isButton)
			.accessibilityRemoveTraits(.isImage)
    }
}

struct Part1View_Previews: PreviewProvider {
    static var previews: some View {
        Part1View()
    }
}
