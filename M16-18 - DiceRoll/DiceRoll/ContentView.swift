//
//  ContentView.swift
//  DiceRoll
//
//  Created by Nikolaj Søgaard Simonsen on 26/04/2022.
//

import SwiftUI

struct ContentView: View {
	@StateObject private var viewModel = ViewModel()
	
	var body: some View {
		NavigationView {
			ZStack {
				AngularGradient(colors: [.black, .yellow], center: .bottom)
					.ignoresSafeArea()
				VStack {
					if let results = viewModel.results {
						ScrollView(.horizontal, showsIndicators: false) {
							HStack {
								ForEach(results.dice.filter { $0.isStationary }) { die in
									Label("Die result is: \(die.eyesShowing)", systemImage: "die.face.\(die.eyesShowing).fill")
										.labelStyle(.iconOnly)
								}
							}
						}
						
						Text("Total = \(results.dice.filter { $0.isStationary }.map { $0.eyesShowing }.reduce(0, +))")
						
						Spacer()
					}
					
					if let currentDie = viewModel.currentDie {
						Label("Die result is: \(currentDie.eyesShowing)", systemImage: "die.face.\(currentDie.eyesShowing).fill")
							.font(.largeTitle)
							.labelStyle(.iconOnly)
							.padding()
					}
					
					Spacer()
					
					Button("Roll") {
						viewModel.rollDie()
					}
					.font(.title)
				}
				.navigationTitle("Dice Roll")
				.toolbar {
					ToolbarItem(placement: .navigationBarTrailing) {
						Button("Start over") {
							viewModel.reset()
						}
					}
				}
			}
		}
		
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
