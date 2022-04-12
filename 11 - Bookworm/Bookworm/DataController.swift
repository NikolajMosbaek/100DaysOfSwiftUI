//
//  DataController.swift
//  Bookworm
//
//  Created by Nikolaj Søgaard Mosbæk Nielsen on 17/02/2022.
//

import CoreData
import Foundation

class DataController: ObservableObject {
	let container = NSPersistentContainer(name: "Bookworm")
	
	init() {
		container.loadPersistentStores { description, error in
			if let error = error {
				print("Core Data failed to load: \(error.localizedDescription)")
			}
		}
	}
}
