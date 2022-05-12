//
//  Dice.swift
//  DiceRoll
//
//  Created by Nikolaj Søgaard Simonsen on 26/04/2022.
//

import Foundation

class Dice: ObservableObject {
	private let storageKey = "dice"
	
	@Published var dice: [Die] = [] {
		didSet {
			if let encoded = try? JSONEncoder().encode(dice) {
				UserDefaults.standard.set(encoded, forKey: storageKey)
			}
		}
	}
	
	init() {
		if let savedDice = UserDefaults.standard.data(forKey: storageKey) {
			if let decodedDice = try? JSONDecoder().decode([Die].self, from: savedDice) {
				dice = decodedDice
			} else {
				dice = []
			}
		} else {
			dice = []
		}
	}
}
