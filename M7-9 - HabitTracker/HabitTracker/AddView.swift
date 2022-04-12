//
//  AddView.swift
//  HabitTracker
//
//  Created by Nikolaj Søgaard Mosbæk Nielsen on 14/02/2022.
//

import SwiftUI

struct AddView: View {
    @ObservedObject var activities: Activities
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var description = ""
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Title", text: $title)
                TextField("Description", text: $description)
            }
            .navigationTitle("Add new activity")
            .toolbar {
                Button("Save") {
                    let activity = Activity(title: title, description: description, amount: 0)
                    activities.activities.append(activity)
                    dismiss()
                }
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(activities: Activities())
    }
}
