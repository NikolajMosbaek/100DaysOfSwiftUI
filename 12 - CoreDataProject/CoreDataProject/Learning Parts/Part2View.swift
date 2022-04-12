//
//  Part2View.swift
//  CoreDataProject
//
//  Created by Nikolaj Søgaard Mosbæk Nielsen on 21/02/2022.
//

import CoreData
import SwiftUI

// For this to run add a "Ship" entity that has "name" and "universe" string attributes to your data model
struct Part2View: View {
	@Environment(\.managedObjectContext) var moc
//	@FetchRequest(sortDescriptors: [], predicate: NSPredicate(format: "NOT name BEGINSWITH[c] %@", "e")) var ships: FetchedResults<Ship>
	
    var body: some View {
		VStack {
//			List(ships, id: \.self) { ship in
//				Text(ship.name ?? "Unknown name")
//			}
//
//			Button("Add Examples") {
//				let ship1 = Ship(context: moc)
//				ship1.name = "Enterprise"
//				ship1.universe = "Star Trek"
//
//				let ship2 = Ship(context: moc)
//				ship2.name = "Defiant"
//				ship2.universe = "Star Trek"
//
//				let ship3 = Ship(context: moc)
//				ship3.name = "Millennum Falcon"
//				ship3.universe = "Star Wars"
//
//				let ship4 = Ship(context: moc)
//				ship4.name = "Executor"
//				ship4.universe = "Star Wars"
//
//				try? moc.save()
//			}
		}
    }
}

struct Part2View_Previews: PreviewProvider {
    static var previews: some View {
        Part2View()
    }
}
