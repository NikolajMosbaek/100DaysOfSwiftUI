//
//  ImageWithName.swift
//  NameReminder
//
//  Created by Nikolaj Søgaard Simonsen on 10/03/2022.
//

import CoreLocation
import SwiftUI

struct ImageWithName: Identifiable, Comparable {
	let id = UUID()
	var image: Image
	var name: String
	var location: CLLocationCoordinate2D
	
	static func == (lhs: ImageWithName, rhs: ImageWithName) -> Bool {
		lhs.id == rhs.id
	}
	
	static func <(lhs: ImageWithName, rhs: ImageWithName) -> Bool {
		lhs.name < rhs.name
	}
}
