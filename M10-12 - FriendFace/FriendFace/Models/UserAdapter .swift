//
//  UserAdapter .swift
//  FriendFace
//
//  Created by Nikolaj Søgaard Mosbæk Nielsen on 24/02/2022.
//

import Foundation

extension User {
	func to(cachedUser: CachedUser) -> CachedUser {
		cachedUser.id = id
		cachedUser.isActive = isActive
		cachedUser.name = name
		cachedUser.age = Int16(age)
		cachedUser.company = company
		cachedUser.email = email
		cachedUser.address = address
		cachedUser.about = about
		cachedUser.registered = registered
		cachedUser.tags = tags.joined(separator: ",")
		cachedUser.friend = nil
		
		if let context = cachedUser.managedObjectContext {
			var cachedFriends: [CachedFriend] = []
			for friend in friends {
				cachedFriends.append(friend.to(cachedFriend: CachedFriend(context: context)))
			}
			
			cachedUser.friend = NSSet(array: cachedFriends)
		}
		
		return cachedUser
	}
}

extension CachedUser {
	func toUser() -> User {
		let set = friend as? Set<Friend> ?? []
		let friends = set.sorted {
			$0.name < $1.name
		}
		
		return User(
			id: wrappedID,
			isActive: isActive,
			name: wrappedName,
			age: Int(age),
			company: wrappedCompany,
			email: wrappedEmail,
			address: wrappedAddress,
			about: wrappedAbout,
			registered: wrappedRegistered,
			tags: wrappedTags.components(separatedBy: ","),
			friends: friends)
	}
}
