//
//  Activity.swift
//  HabitTracker
//
//  Created by Nikolaj Søgaard Mosbæk Nielsen on 14/02/2022.
//

import Foundation

struct Activity: Identifiable, Codable, Equatable {
    var id = UUID()
    var title: String
    var description: String
    var amount: Int
}
