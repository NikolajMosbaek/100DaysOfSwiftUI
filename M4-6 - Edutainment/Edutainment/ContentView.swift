//
//  ContentView.swift
//  Edutainment
//
//  Created by Nikolaj Søgaard Mosbæk Nielsen on 27/12/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var table = 2
    @State private var numberOfQuestions = 5
    @State private var isActive = false
    
    var body: some View {
        NavigationView {
            VStack {
                Stepper("Select table: \(table)", value: $table, in: 2...12)
                Stepper("How many questions? \(numberOfQuestions)", value: $numberOfQuestions, in: 5...20, step: 5)
                NavigationLink("Start Game", destination: GameView(shouldPopToFrontPage: $isActive, table: table, numberOfQuestions: numberOfQuestions), isActive: $isActive)
            }
            .navigationTitle("Edutainment")
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
