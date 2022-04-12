//
//  Part3View.swift
//  Instafilter
//
//  Created by Nikolaj Søgaard Mosbæk Nielsen on 25/02/2022.
//

import SwiftUI

struct Part3View: View {
	@State private var image: Image?
    var body: some View {
		VStack {
			image?
				.resizable()
				.scaledToFit()
		}
		.onAppear(perform: loadImage)
    }
	
	func loadImage() {
		guard let inputImage = UIImage(named: "Example") else { return }
		let beginImage = CIImage(image: inputImage)
		
		let context = CIContext()
		let currentFilter = CIFilter.crystallize()
		currentFilter.inputImage = beginImage
		
		let amount = 1.0
		let inputKeys = currentFilter.inputKeys
		
		if inputKeys.contains(kCIInputIntensityKey) {
			currentFilter.setValue(amount, forKey: kCIInputIntensityKey)
		}
		
		if inputKeys.contains(kCIInputRadiusKey) {
			currentFilter.setValue(amount * 200, forKey: kCIInputRadiusKey)
		}
		
		if inputKeys.contains(kCIInputScaleKey) {
			currentFilter.setValue(amount * 10, forKey: kCIInputScaleKey)
		}
		
		guard let outputImage = currentFilter.outputImage else { return }
		
		if let cgImage = context.createCGImage(outputImage, from: outputImage.extent) {
			let uiImage = UIImage(cgImage: cgImage)
			image = Image(uiImage: uiImage)
		}
	}
}

struct Part3View_Previews: PreviewProvider {
    static var previews: some View {
        Part3View()
    }
}
