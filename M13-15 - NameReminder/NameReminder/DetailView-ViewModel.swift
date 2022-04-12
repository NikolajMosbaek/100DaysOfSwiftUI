//
//  DetailView-ViewModel.swift
//  NameReminder
//
//  Created by Nikolaj Søgaard Simonsen on 30/03/2022.
//

import MapKit
import SwiftUI

extension DetailView {
	@MainActor class ViewModel: ObservableObject {
		@Published var mapRegion = MKCoordinateRegion(
			center: CLLocationCoordinate2D(latitude: 0, longitude: 0),
			span: MKCoordinateSpan(latitudeDelta: 25, longitudeDelta: 25)
		)
		@Published private(set) var image: Image!
		@Published private(set) var name: String!
		
		init(image: ImageWithName) {
			self.set(image: image.image, name: image.name, location: image.location)
		}
		
		func set(image: Image, name: String, location: CLLocationCoordinate2D) {
			mapRegion.center = location
			self.image = image
			self.name = name
		}
	}
}
