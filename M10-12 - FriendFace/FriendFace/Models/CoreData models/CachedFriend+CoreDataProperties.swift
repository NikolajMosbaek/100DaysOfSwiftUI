//
//  CachedFriend+CoreDataProperties.swift
//  FriendFace
//
//  Created by Nikolaj Søgaard Mosbæk Nielsen on 24/02/2022.
//
//

import Foundation
import CoreData


extension CachedFriend {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CachedFriend> {
        return NSFetchRequest<CachedFriend>(entityName: "CachedFriend")
    }

    @NSManaged public var id: String?
    @NSManaged public var name: String?

	public var wrappedID: String {
		id ?? UUID().uuidString
	}
	
	public var wrappedName: String {
		name ?? "Unknown Friend"
	}
}

extension CachedFriend : Identifiable {

}
