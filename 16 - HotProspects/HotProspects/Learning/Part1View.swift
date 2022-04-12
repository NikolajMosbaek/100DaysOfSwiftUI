//
//  Part1View.swift
//  HotProspects
//
//  Created by Nikolaj Søgaard Simonsen on 31/03/2022.
//

import SwiftUI

@MainActor class User: ObservableObject {
	@Published var name = "Taylor Swift"
}

struct EditView: View {
	@EnvironmentObject var user: User
	
	var body: some View {
		TextField("Name", text: $user.name)
	}
}

struct DisplayView: View {
	@EnvironmentObject var user: User
	
	var body: some View {
		Text(user.name)
	}
}

struct Part1View: View {
	@StateObject private var user = User()

    var body: some View {
		VStack {
			EditView()
			DisplayView()
		}
		.environmentObject(user)
    }
}

struct Part1View_Previews: PreviewProvider {
    static var previews: some View {
        Part1View()
    }
}
