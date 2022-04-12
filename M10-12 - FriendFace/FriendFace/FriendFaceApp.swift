//
//  FriendFaceApp.swift
//  FriendFace
//
//  Created by Nikolaj Søgaard Mosbæk Nielsen on 23/02/2022.
//

import SwiftUI

@main
struct FriendFaceApp: App {
	@StateObject private var dataController = DataController()
	
    var body: some Scene {
        WindowGroup {
            ContentView()
				.environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
