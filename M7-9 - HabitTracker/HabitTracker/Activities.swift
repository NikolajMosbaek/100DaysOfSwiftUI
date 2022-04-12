//
//  Activities.swift
//  HabitTracker
//
//  Created by Nikolaj Søgaard Mosbæk Nielsen on 14/02/2022.
//

import Foundation

class Activities: ObservableObject {
    private let storageKey = "activities"
    
    @Published var activities: [Activity] = [] {
        didSet {
            if let encoded = try? JSONEncoder().encode(activities) {
                UserDefaults.standard.set(encoded, forKey: storageKey)
            }
        }
    }
    
    init() {
        if let savedActivities = UserDefaults.standard.data(forKey: storageKey) {
            if let decodedActivities = try? JSONDecoder().decode([Activity].self, from: savedActivities) {
                activities = decodedActivities
            } else {
                activities = []
            }
        } else {
            activities = []
        }
    }
}
