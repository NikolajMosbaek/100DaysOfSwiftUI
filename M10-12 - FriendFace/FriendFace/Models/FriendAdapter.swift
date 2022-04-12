//
//  FriendAdapter.swift
//  FriendFace
//
//  Created by Nikolaj Søgaard Mosbæk Nielsen on 24/02/2022.
//

import Foundation

extension Friend {
	func to(cachedFriend: CachedFriend) -> CachedFriend {
		cachedFriend.id = id
		cachedFriend.name = name
		
		return cachedFriend
	}
}

extension CachedFriend {
	func toFriend() -> Friend {
		return Friend(
			id: wrappedID,
			name: wrappedName)
	}
}
