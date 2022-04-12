//
//  DetailView.swift
//  HabitTracker
//
//  Created by Nikolaj Søgaard Mosbæk Nielsen on 14/02/2022.
//

import SwiftUI

struct DetailView: View {
    var activity: Activity
    var activities: Activities
    
    var body: some View {
        VStack {
            Text(activity.title)
                .font(.title)
                .padding([.bottom])
            Text(activity.description)
                .padding()
            Text("Completed \(activity.amount) times")
                .font(.headline)
            Button("I did it once more") {
                let activityIndex = activities.activities.firstIndex(of: activity)!
                activities.activities[activityIndex].amount += 1
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(activity: Activity(
            title: "Run",
            description: "Go for a very long run and don't come back before you're very very tired",
            amount: 14), activities: Activities()
        )
    }
}
