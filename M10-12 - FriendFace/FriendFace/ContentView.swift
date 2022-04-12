//
//  ContentView.swift
//  FriendFace
//
//  Created by Nikolaj Søgaard Mosbæk Nielsen on 23/02/2022.
//

import SwiftUI

struct ContentView: View {
	@Environment(\.managedObjectContext) var moc
	@FetchRequest(sortDescriptors: [SortDescriptor(\.name)], predicate: nil) var cachedUsers: FetchedResults<CachedUser>
	@FetchRequest(sortDescriptors: [SortDescriptor(\.name)], predicate: nil) var cachedFriends: FetchedResults<CachedFriend>
	
	@State private var users: [User] = []
	
    var body: some View {
		NavigationView {
			List(users, id: \.id) { user in
				NavigationLink {
					UserDetailView(user: user)
				} label: {
					Text(user.name)
				}
				
			}
			.navigationTitle("FriendFace")
		}
		
			.task {
				await fetchUsers()
			}
    }
	
	func fetchUsers() async {
		guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
			print("Invalid URL")
			return
		}
		
		do {
			let (data, _) = try await URLSession.shared.data(from: url)
			
			let decoder = JSONDecoder()
			decoder.dateDecodingStrategy = .iso8601
			if let decodedResponse = try? decoder.decode([User].self, from: data) {
				await MainActor.run {
					users = decodedResponse
				}
				
				var usersForCaching: [CachedUser] = []
				for user in users {
					usersForCaching.append(user.to(cachedUser: CachedUser(context: moc)))
				}
				
//				if moc.hasChanges {
				print("Saving")
				do {
					try moc.save()
				} catch {
					print("Save error: \(error.localizedDescription)")
				}
//				}
				
			}
		} catch {
			users = []
			await MainActor.run {
				for cachedUser in cachedUsers {
					users.append(cachedUser.toUser())
				}
			}
		}
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
