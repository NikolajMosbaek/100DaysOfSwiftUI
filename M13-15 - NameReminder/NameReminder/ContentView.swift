//
//  ContentView.swift
//  NameReminder
//
//  Created by Nikolaj Søgaard Simonsen on 10/03/2022.
//

import SwiftUI

struct ContentView: View {
	@State private var loadedImage: UIImage?
	@State private var images: [ImageWithName] = []
	@State private var imageName = ""
		
    var body: some View {
		NavigationView {
			List {
				ForEach(images.sorted()) { image in
					NavigationLink {
						DetailView(image: image)
					} label: {
						Text(image.name)
					}
				}
			}
			.toolbar {
				NavigationLink("Load image") {
					AddImageView(images: $images)
				}
			}
			.navigationTitle("Name Reminder")
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
