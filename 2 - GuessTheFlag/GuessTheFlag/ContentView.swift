//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Nikolaj Søgaard Mosbæk Nielsen on 08/11/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var showScore = false
    @State private var scoreTitle = ""
    @State private var wrontTitle = ""
    @State private var score = 0
    @State private var numberOfQuestionsAsked = 0
    @State private var gameOver = false
    @State private var animationAmounts = [0.0, 0.0, 0.0]
    @State private var animateOpacity = false
    @State private var shakeAnimationAmounts = [0, 0, 0]
    @State private var shake = false
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
	
	let labels = [
		"Estonia": "Flag with three horizontal stripes of equal size. Top stripe blue, middle stripe black, bottom stripe white",
		"France": "Flag with three vertical stripes of equal size. Left stripe blue, middle stripe white, right stripe red",
		"Germany": "Flag with three horizontal stripes of equal size. Top stripe black, middle stripe red, bottom stripe gold",
		"Ireland": "Flag with three vertical stripes of equal size. Left stripe green, middle stripe white, right stripe orange",
		"Italy": "Flag with three vertical stripes of equal size. Left stripe green, middle stripe white, right stripe red",
		"Nigeria": "Flag with three vertical stripes of equal size. Left stripe green, middle stripe white, right stripe green",
		"Poland": "Flag with two horizontal stripes of equal size. Top stripe white, bottom stripe red",
		"Russia": "Flag with three horizontal stripes of equal size. Top stripe white, middle stripe blue, bottom stripe red",
		"Spain": "Flag with three horizontal stripes. Top thin stripe red, middle thick stripe gold with a crest on the left, bottom thin stripe red",
		"UK": "Flag with overlapping red and white crosses, both straight and diagonally, on a blue background",
		"US": "Flag with red and white stripes of equal size, with white stars on a blue background in the top-left corner"
	]
    
    struct BounceEffect: GeometryEffect {
        func effectValue(size: CGSize) -> ProjectionTransform {
            ProjectionTransform(CGAffineTransform(translationX: -30 * sin(position * 2 * .pi), y: 0))
        }
        
        init(shakes: Int) {
            position = CGFloat(shakes)
        }
        
        var position: CGFloat
        var animatableData: CGFloat {
            get { position }
            set { position = newValue }
        }
    }
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 700)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("Guess the flag")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        flagImage(country: countries[number], accessibilityLabel: labels[countries[number], default: "Unknown flag"])
                        .rotation3DEffect(.degrees(animationAmounts[number]), axis: (x: 0, y: 1, z: 0))
                        .opacity(animateOpacity ? (number == correctAnswer ? 1 : 0.25) : 1)
                        .modifier(BounceEffect(shakes: shake ? (number == correctAnswer ? 0 : 3) : 0))
                        .onTapGesture {
                            flagTapped(number)
                            withAnimation(.interpolatingSpring(stiffness: 10, damping: 2)) {
                                animationAmounts[number] += 360
                            }
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score: \(score)")
                    .foregroundColor(.white)
                    .font(.title.bold())
                
                Spacer()
            }
            .padding()
        }
        
        .alert(scoreTitle, isPresented: $showScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text(wrontTitle)
        }
        
        .alert("Game Over", isPresented: $gameOver) {
            Button("Reset game", action: resetGame)
        } message: {
            Text("Your final score is \(score)")
        }
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            wrontTitle = ""
            score += 1
        } else {
            scoreTitle = "Wrong"
            wrontTitle = "This is the flag of \(countries[number])"
            score -= 1
            
            withAnimation {
                shake = true
            }
        }
        
        showScore = true
        
        withAnimation {
            animateOpacity = true
        }
    }
    
    func askQuestion() {
        withAnimation {
            animateOpacity = false
        }
        shake = false
        
        numberOfQuestionsAsked += 1
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        gameOver = numberOfQuestionsAsked == 8
    }
    
    func resetGame() {
        askQuestion()
        numberOfQuestionsAsked = 0
        gameOver = false
        score = 0
    }
}

struct FlagImage: ViewModifier {
    var country: String
	var accessibilityLabel: String
    
    func body(content: Content) -> some View {
        Image(country)
            .renderingMode(.original)
            .clipShape(Capsule())
            .shadow(radius: 5)
			.accessibilityLabel(accessibilityLabel)
    }
}

extension View {
    func flagImage(country: String, accessibilityLabel: String) -> some View {
        modifier(FlagImage(country: country, accessibilityLabel: accessibilityLabel))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
