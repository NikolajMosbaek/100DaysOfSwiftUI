//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Nikolaj Søgaard Mosbæk Nielsen on 21/02/2022.
//

import CoreData
import SwiftUI

struct FilteredList<T: NSManagedObject, Content: View>: View {
	@FetchRequest var fetchRequest: FetchedResults<T>
	let content: (T) -> Content
	
    var body: some View {
		List(fetchRequest, id: \.self) { item in
			self.content(item)
		}
    }
	
	init(filterKey: String, filterValue: String, filterParameter: PredicateParameter, @ViewBuilder content: @escaping (T) -> Content) {
		switch filterParameter {
		case .beginsWith:
			_fetchRequest = FetchRequest<T>(sortDescriptors: [], predicate: NSPredicate(format: "%K BEGINSWITH[c] %@", filterKey, filterValue))
		case .isEqualTo:
			_fetchRequest = FetchRequest<T>(sortDescriptors: [], predicate: NSPredicate(format: "%K ==[c] %@", filterKey, filterValue))
		case .contains:
			_fetchRequest = FetchRequest<T>(sortDescriptors: [], predicate: NSPredicate(format: "%K CONTAINS[c] %@", filterKey, filterValue))
		case .endsWith:
			_fetchRequest = FetchRequest<T>(sortDescriptors: [], predicate: NSPredicate(format: "%K ENDSWITH[c] %@", filterKey, filterValue))
		}
		self.content = content
	}
}
