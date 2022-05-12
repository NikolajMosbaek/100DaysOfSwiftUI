//
//  ContentView-ViewModel.swift
//  DiceRoll
//
//  Created by Nikolaj Søgaard Simonsen on 26/04/2022.
//

import Foundation

extension ContentView {
	@MainActor class ViewModel: ObservableObject {
		@Published var results = Dice()
		@Published var currentDie: Die?
		
		private var timer = Timer()
		
		func rollDie() {
			currentDie = nil
			
			currentDie = Die(eyesShowing: Int.random(in: 1...6))
			
			var timerCount = 0
			timer = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true) { [weak self] timer in
				print("Timer fired")
				self?.currentDie?.eyesShowing = Int.random(in: 1...6)
				timerCount += 1
				
				if timerCount == 10 {
					print("Timer invalidated")
					timer.invalidate()
					self?.currentDie?.isStationary = true
					if let die = self?.currentDie {
						self?.results.dice.append(die)
					}
				}
			}
		}
		
		func reset() {
			currentDie = nil
			results.dice = []
		}
	}
}
