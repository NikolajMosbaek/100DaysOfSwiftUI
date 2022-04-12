//
//  User.swift
//  FriendFace
//
//  Created by Nikolaj Søgaard Mosbæk Nielsen on 23/02/2022.
//

import Foundation

struct User: Codable {
	var id: String
	var isActive: Bool
	var name: String
	var age: Int
	var company: String
	var email: String
	var address: String
	var about: String
	var registered: Date
	var tags: [String]
	var friends: [Friend]
}


