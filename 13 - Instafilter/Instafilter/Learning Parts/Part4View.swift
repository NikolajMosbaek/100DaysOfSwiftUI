//
//  Part4View.swift
//  Instafilter
//
//  Created by Nikolaj Søgaard Mosbæk Nielsen on 25/02/2022.
//

import SwiftUI

struct Part4View: View {
	@State private var image: Image?
	@State private var inputImage: UIImage?
	@State private var showingImagePicker = false
	
    var body: some View {
		VStack {
			image?
				.resizable()
				.scaledToFit()
			
			Button("Select Image") {
				showingImagePicker = true
			}
			
			Button("Save Image") {
				guard let inputImage = inputImage else { return }
				
				let imageSaver = ImageSaver()
				imageSaver.writeToPhotoAlbum(image: inputImage)
			}
		}
		.sheet(isPresented: $showingImagePicker) {
			ImagePicker(image: $inputImage)
		}
		.onChange(of: inputImage) { _ in loadImage() }
    }
	
	func loadImage() {
		guard let inputImage = inputImage else { return }
		image = Image(uiImage: inputImage)
	}
}

struct Part4View_Previews: PreviewProvider {
    static var previews: some View {
        Part4View()
    }
}
