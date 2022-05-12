//
//  Favorites.swift
//  SnowSeeker
//
//  Created by Nikolaj Søgaard Simonsen on 29/04/2022.
//

import Foundation

class Favorites: ObservableObject {
	private var resorts: Set<String>
	private let saveKey = "Favorites"
	
	init() {
		if let savedFavorites = UserDefaults.standard.data(forKey: saveKey) {
			if let savedFavorites = try? JSONDecoder().decode(Set<String>.self, from: savedFavorites) {
				resorts = savedFavorites
			} else {
				resorts = []
			}
		} else {
			resorts = []
		}
	}
	
	func contains(_ resort: Resort) -> Bool {
		resorts.contains(resort.id)
	}
	
	func add(_ resort: Resort) {
		objectWillChange.send()
		resorts.insert(resort.id)
		save()
	}
	
	func remove(_ resort: Resort) {
		objectWillChange.send()
		resorts.remove(resort.id)
		save()
	}
	
	func save() {
		if let encoded = try? JSONEncoder().encode(resorts) {
			UserDefaults.standard.set(encoded, forKey: saveKey)
		}
	}
}
