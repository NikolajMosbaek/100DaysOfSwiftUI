//
//  ContentView.swift
//  RockPaperScissor
//
//  Created by Nikolaj Søgaard Mosbæk Nielsen on 23/11/2021.
//

import SwiftUI

enum Move: String, CaseIterable {
    case rock
    case paper
    case scissor
    
    func isBeatenBy() -> Move {
        switch self {
        case .rock:
            return .paper
        case .paper:
            return .scissor
        case .scissor:
            return .rock
        }
    }
}

enum Result {
    case win
    case lose
    case tie
}

struct ContentView: View {
    private let possibleMoves = Move.allCases
    
    @State private var result: Result? = nil
    @State private var score: Int = 0
    @State private var gameCount: Int = 0
    @State private var scoreTitle = ""
    @State private var showScore = false
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.white, .yellow]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack {
                Spacer()
                Text("Choose you weapon")
                    .font(.system(.largeTitle))
                    .bold()
                Spacer()
                ForEach(possibleMoves, id: \.self) { move in
                    gameButton(move: move, action: {
                        select(move: move)
                    })
                }
                Spacer()
                Text("Score: \(score)")
                Spacer()
            }
        }
        
        .alert(scoreTitle, isPresented: $showScore) {
            Button("Continue") {
                
            }
        }
    }
        
    func select(move: Move) {
        let computerMove = self.possibleMoves.randomElement() ?? .rock
        result = didPlayerWin(playerMove: move, computerMove: computerMove)
        
        scoreTitle = "Computer selected \(computerMove.rawValue). "
        if result == .win {
            score += 1
            scoreTitle += "You won"
        } else if result == .lose {
            score -= 1
            scoreTitle += "You lost"
        } else {
            scoreTitle += "It was a tie"
        }
        
        showScore = true
    }
    
    func didPlayerWin(playerMove: Move, computerMove: Move) -> Result {
        if playerMove == computerMove {
            return .tie
        }
        
        if playerMove.isBeatenBy() == computerMove {
            return .lose
        } else {
            return .win
        }
    }
}

struct GameButton: ViewModifier {
    var move: Move
    var action: () -> Void
    
    func body(content: Content) -> some View {
        Button {
            action()
        } label: {
            Image(move.rawValue)
                .resizable()
                .frame(width: 266, height: 150)
                .cornerRadius(35)
                .shadow(radius: 5)
        }
    }
}

extension View {
    func gameButton(move: Move, action: @escaping () -> Void) -> some View {
        modifier(GameButton(move: move, action: action))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
