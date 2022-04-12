//
//  DataController.swift
//  CoreDataProject
//
//  Created by Nikolaj Søgaard Mosbæk Nielsen on 18/02/2022.
//

import CoreData
import Foundation

class DataController: ObservableObject {
	let container = NSPersistentContainer(name: "FriendFace")
	
	init() {
		container.loadPersistentStores { description, error in
			if let error = error {
				print("Core Data failed to load: \(error.localizedDescription)")
			}
			
			self.container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
		}
	}
}
