//
//  Singer+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Nikolaj Søgaard Mosbæk Nielsen on 21/02/2022.
//
//

import Foundation
import CoreData


extension Singer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Singer> {
        return NSFetchRequest<Singer>(entityName: "Singer")
    }

    @NSManaged public var firstname: String?
    @NSManaged public var lastname: String?

	var wrappedFirstName: String {
		firstname ?? "Unknown"
	}
	
	var wrappedLastName: String {
		lastname ?? "Unknown"
	}
}

extension Singer : Identifiable {

}
