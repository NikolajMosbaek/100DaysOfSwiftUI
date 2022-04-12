//
//  Part3View.swift
//  CoreDataProject
//
//  Created by Nikolaj Søgaard Mosbæk Nielsen on 21/02/2022.
//

import CoreData
import SwiftUI

// For this to run please add a 'Singer' Entity to the data model and give it two string attributes called 'firstname' and 'lastname'. Set codegen to manual/none

enum PredicateParameter: String, CaseIterable {
	case beginsWith = "begins with"
	case isEqualTo = "is exactly"
	case contains = "contains"
	case endsWith = "ends with"
}

struct Part3View: View {
	@Environment(\.managedObjectContext) var moc
	@State private var filterKey = "lastname"
	@State private var predicateParameter: PredicateParameter  = .beginsWith
	@State private var filterValue = ""
	
	let filterKeys = ["firstname", "lastname"]
	
	var body: some View {
		NavigationView {
			VStack {
				Form {
					Section("Search") {
						Picker("Find where", selection: $filterKey) {
							ForEach(filterKeys, id: \.self) {
								Text($0)
							}
						}
						
						Picker("Satisfies", selection: $predicateParameter) {
							ForEach(PredicateParameter.allCases, id: \.self) {
								Text($0.rawValue)
							}
						}
						
						TextField("Input search text", text: $filterValue)
					}
				}
				
				FilteredList(filterKey: filterKey, filterValue: filterValue, filterParameter: predicateParameter) { (singer: Singer) in
					Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
				}
				
				Button("Add examples") {
					let taylor = Singer(context: moc)
					taylor.firstname = "Taylor"
					taylor.lastname = "Swift"
					
					let ed = Singer(context: moc)
					ed.firstname = "Ed"
					ed.lastname = "Sheeran"
					
					let adele = Singer(context: moc)
					adele.firstname = "Adele"
					adele.lastname = "Adkins"
					
					try? moc.save()
				}
			}
		}
	}
}

struct Part3View_Previews: PreviewProvider {
	static var previews: some View {
		Part3View()
	}
}
