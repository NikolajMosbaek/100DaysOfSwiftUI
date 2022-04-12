//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Nikolaj Søgaard Mosbæk Nielsen on 17/02/2022.
//

import SwiftUI

@main
struct BookwormApp: App {
	@StateObject private var dataController = DataController()
	
    var body: some Scene {
        WindowGroup {
            ContentView()
				.environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
