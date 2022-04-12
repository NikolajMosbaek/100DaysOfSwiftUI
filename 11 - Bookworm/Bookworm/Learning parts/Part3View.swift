//
//  Part3View.swift
//  Bookworm
//
//  Created by Nikolaj Søgaard Mosbæk Nielsen on 17/02/2022.
//

import SwiftUI

// This needs a student entity in Bookworm.xcdatamodeld containing id: UUID & name: String attributes
struct Part3View: View {
//	@Environment(\.managedObjectContext) var moc
//	@FetchRequest(sortDescriptors: []) var students: FetchedResults<Student>
	
    var body: some View {
		VStack {
//			List(students) { student in
//				Text(student.name ?? "Unknown")
//			}
//
//			Button("Add") {
//				let firstNames = ["Ginny", "Harry", "Hermione", "Luna", "Ron"]
//				let lastNames = ["Granger", "Lovegood", "Potter", "Weasley"]
//
//				let chosenFirstName = firstNames.randomElement()!
//				let chosenLastName = lastNames.randomElement()!
//
//				let student = Student(context: moc)
//				student.id = UUID()
//				student.name = "\(chosenFirstName) \(chosenLastName)"
//
//				try? moc.save()
//			}
		}
    }
}

struct Part3View_Previews: PreviewProvider {
    static var previews: some View {
        Part3View()
    }
}
