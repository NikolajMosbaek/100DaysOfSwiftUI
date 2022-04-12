//
//  Prospect.swift
//  HotProspects
//
//  Created by Nikolaj Søgaard Simonsen on 05/04/2022.
//

import SwiftUI

enum peopleSortOrder {
	case byName
	case byDate
}

class Prospect: Identifiable, Codable {
	var id = UUID()
	var name = "Anonymous"
	var emailAddress = ""
	fileprivate(set) var isContacted = false
	fileprivate(set) var addDate: Date?
}

@MainActor class Prospects: ObservableObject {
	@Published private(set)var people: [Prospect]
	let savedPath = FileManager.documentsDirectory.appendingPathComponent("SavedProspects")
	
	init() {
		do {
			let data = try Data(contentsOf: savedPath)
			people = try JSONDecoder().decode([Prospect].self, from: data)
		} catch {
			people = []
		}
	}
	
	private func save() {
		do {
			let data = try JSONEncoder().encode(people)
			try data.write(to: savedPath, options: [.atomic, .completeFileProtection])
		} catch {
			print("Unable to save data")
		}
	}
	
	func add(_ prospect: Prospect) {
		prospect.addDate = Date.now
		people.append(prospect)
		save()
	}
	
	func toggle(_ prospect: Prospect) {
		objectWillChange.send()
		prospect.isContacted.toggle()
		save()
	}
	
	func sort(by sortOrder: peopleSortOrder) {
		switch sortOrder {
		case .byName:
			self.people = self.people.sorted(by: { p1, p2 in
				return p1.name < p2.name
			})
		case .byDate:
			self.people = self.people.sorted(by: { p1, p2 in
				guard let p1Date = p1.addDate, let p2Date = p2.addDate else { return false }
				return p1Date < p2Date
			})
		}
	}
}
