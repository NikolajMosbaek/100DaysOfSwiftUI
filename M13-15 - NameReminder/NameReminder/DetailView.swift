//
//  DetailView.swift
//  NameReminder
//
//  Created by Nikolaj Søgaard Simonsen on 28/03/2022.
//

import MapKit
import SwiftUI

struct DetailView: View {
	@StateObject private var viewModel = ViewModel() {
		didSet {
			viewModel.set(image: image.image, name: image.name, location: image.location)
		}
	}
	var image: ImageWithName
		
    var body: some View {
		VStack {
			Text(viewModel.name)
				.font(.title)
			
			viewModel.image
				.resizable()
				.scaledToFit()
			
			Spacer()
			
			Map(coordinateRegion: $viewModel.mapRegion)
		}
	}
}
