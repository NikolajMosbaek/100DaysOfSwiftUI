//
//  Part2View.swift
//  SnowSeeker
//
//  Created by Nikolaj Søgaard Simonsen on 27/04/2022.
//

import SwiftUI

struct User: Identifiable {
	var id = "Taylor Swift"
}

struct Part2View: View {
	@State private var selectedUser: User? = nil
	@State private var isShowingUserAlert = false
	
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
			.onTapGesture {
				selectedUser = User()
				isShowingUserAlert = true
			}
			.sheet(item: $selectedUser) { user in
				Text(user.id)
			}
			.alert("Welcome", isPresented: $isShowingUserAlert, presenting: selectedUser) { user in
				Button(user.id) { }
			}
    }
}

struct Part2View_Previews: PreviewProvider {
    static var previews: some View {
        Part2View()
    }
}
