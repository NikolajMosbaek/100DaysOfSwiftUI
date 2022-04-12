//
//  AddImageView.swift
//  NameReminder
//
//  Created by Nikolaj Søgaard Simonsen on 10/03/2022.
//

import SwiftUI

struct AddImageView: View {
	@Environment(\.dismiss) var dismiss
	
	@Binding var images: [ImageWithName]
	@State private var inputImage: UIImage?
	@State private var image: Image?
	@State private var name = ""
	@State private var askForName = false
	
	let locationFetcher = LocationFetcher()
	
    var body: some View {
		VStack {
			if !askForName {
				ImagePicker(image: $inputImage)
			}
			if askForName {
				Spacer()
				TextField("Input name of person", text: $name)
					.padding(.horizontal)
				Spacer()
			}
		}
		.onChange(of: inputImage) { newImage in
			if let unwrappedNewImage = newImage {
				self.image = Image(uiImage: unwrappedNewImage)
				self.locationFetcher.start()
				askForName = true
			}
		}
		.toolbar {
			Button("Save") {
				guard
					let image = image,
					let location = locationFetcher.lastKnownLocation
				else {
					return
				}
				
				images.append(ImageWithName(image: image, name: name, location: location))
				dismiss()
			}
			.disabled(image == nil || name.isEmpty || locationFetcher.lastKnownLocation == nil)
		}
    }
}

struct AddImageView_Previews: PreviewProvider {
    static var previews: some View {
		AddImageView(images: .constant([]))
    }
}
