//
//  ContentView.swift
//  HabitTracker
//
//  Created by Nikolaj Søgaard Mosbæk Nielsen on 14/02/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var activities = Activities()
    @State private var showAddActivity = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(activities.activities) { activity in
                    HStack {
                        NavigationLink {
                            DetailView(activity: activity, activities: activities)
                        } label: {
                            Text(activity.title)
                            Spacer()
                            Text("\(activity.amount)")
                        }
                    }
                }
            }
            .navigationTitle("Habit Tracker")
            .toolbar {
                Button {
                    showAddActivity = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showAddActivity) {
                AddView(activities: activities)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
