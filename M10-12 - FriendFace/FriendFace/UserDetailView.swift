//
//  UserDetailView.swift
//  FriendFace
//
//  Created by Nikolaj Søgaard Mosbæk Nielsen on 23/02/2022.
//

import SwiftUI

struct UserDetailView: View {
	var user: User
	
    var body: some View {
		VStack {
			HStack {
				Text(user.name)
					.font(.title)
				
				Circle()
					.frame(width: 15, height: 15)
					.foregroundColor(user.isActive ? .green : .red)
			}
			Text("\(user.age) years old")
			
			Text(user.about)
				.padding()
			
			ScrollView(.horizontal) {
				HStack {
					ForEach(user.friends, id: \.id) { friend in
						NavigationLink {
							Text("I want to look up the friends ID in the fetched user array and use that to push to a detail view of the selected user. But since I haven't learned how to use MVVM yet I'll implement this feature later on")
						} label: {
							Text(friend.name)
								.frame(width: 100, height: 50)
								.padding()
								.overlay {
									RoundedRectangle(cornerRadius: 20)
										.stroke(.black, lineWidth: 1)
								}
						}
						
					}
				}
				.padding()
			}
		}
		.navigationTitle(user.name)
		.navigationBarTitleDisplayMode(.inline)
	}
}

struct UserDetailView_Previews: PreviewProvider {
	static var previews: some View {
		UserDetailView(user: User(id: "1", isActive: true, name: "Nikolaj Simonsen", age: 33, company: "Capgemini", email: "nikolaj.simonsen@capgemini.com", address: "Bjarkesvej 18", about: "Hello there. I am taking the 100 days of SwiftUI course by Paul Hudson", registered: Date.now, tags: ["iOS", "Fun", "Not that fun"], friends: [Friend(id: "2", name: "Rikke Simonsen")]))
    }
}
