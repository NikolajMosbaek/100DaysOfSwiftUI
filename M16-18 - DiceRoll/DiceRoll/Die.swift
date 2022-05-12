//
//  Die.swift
//  DiceRoll
//
//  Created by Nikolaj Søgaard Simonsen on 26/04/2022.
//

import Foundation

struct Die: Identifiable, Codable {
	var id = UUID()
	var eyesShowing: Int
	var isStationary = false
}
