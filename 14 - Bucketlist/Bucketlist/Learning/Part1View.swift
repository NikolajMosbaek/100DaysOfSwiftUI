//
//  Part1View.swift
//  Bucketlist
//
//  Created by Nikolaj Søgaard Mosbæk Nielsen on 02/03/2022.
//

import SwiftUI

struct User: Identifiable, Comparable {
	let id = UUID()
	let firstName: String
	let lastName: String
	
	static func <(lhs: User, rhs: User) -> Bool {
		lhs.lastName < rhs.lastName
	}
}

struct Part1View: View {
	let users = [
		User(firstName: "Arnold", lastName: "Rimmer"),
		User(firstName: "Kristine", lastName: "Kochanski"),
		User(firstName: "David", lastName: "Lister")
	].sorted()
	
    var body: some View {
		List(users) { user in
			Text("\(user.firstName) \(user.lastName)")
		}
    }
}

struct Part1View_Previews: PreviewProvider {
    static var previews: some View {
        Part1View()
    }
}
