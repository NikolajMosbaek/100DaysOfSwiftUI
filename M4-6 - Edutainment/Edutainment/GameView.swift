//
//  GameView.swift
//  Edutainment
//
//  Created by Nikolaj Søgaard Mosbæk Nielsen on 27/12/2021.
//

import SwiftUI

struct GameView: View {
    @Binding var shouldPopToFrontPage: Bool
    
    let table: Int
    let numberOfQuestions: Int
    
    @State private var quesitonsAsked = 0
    @State private var number = Int.random(in: 0...10)
    @State private var answer = ""
    
    @State private var showResult = false
    @State private var gameEnded = false
    @State private var numberOfCorrectAnswers = 0
    
    private var question: String {
        return "What is \(number) x \(table)?"
    }
    
    private var answerIsCorrect: Bool {
        Int(answer) ?? 0 == number*table
    }
    
    var body: some View {
        VStack {
            Text(question)
            TextField("Enter answer", text: $answer)
                .onChange(of: answer) { _ in
                    showResult = false
                }
            Button("That's my answer!") {
                quesitonsAsked += 1
                
                showResult = true
                
                if answerIsCorrect {
                    numberOfCorrectAnswers += 1
                }
            }
            
            
            .alert(answerIsCorrect ? "Correct" : "Incorrect", isPresented: $showResult) {
                Button("Continue") {
                    if quesitonsAsked == numberOfQuestions {
                        gameEnded = true
                    } else {
                        nextQuestion()
                    }
                }
            }
            .alert("Game ended", isPresented: $gameEnded) {
                Button("Go back") {
                    shouldPopToFrontPage = false
                }
                
            } message: {
                Text("Your final score is: \(numberOfCorrectAnswers)")
            }
        }
        .padding()
    }
    
    func nextQuestion() {
        showResult = false
        number = Int.random(in: 0...10)
        answer = ""
    }
}

struct GameView_Previews: PreviewProvider {
    
    static var previews: some View {
        GameView(shouldPopToFrontPage: .constant(false), table: 2, numberOfQuestions: 5)
    }
}
