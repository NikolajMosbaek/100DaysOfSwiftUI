//
//  ContentView.swift
//  Bucketlist
//
//  Created by Nikolaj Søgaard Mosbæk Nielsen on 02/03/2022.
//

import MapKit
import SwiftUI

struct ContentView: View {
	@StateObject private var viewModel = ViewModel()
	
	var body: some View {
		if viewModel.isUnlocked {
			
			ZStack {
				Map(coordinateRegion: $viewModel.mapRegion, annotationItems: viewModel.locations) { location in
					MapAnnotation(coordinate: location.coordinate) {
						VStack {
							Image(systemName: "star.circle")
								.resizable()
								.foregroundColor(.red)
								.frame(width: 44, height: 44)
								.background(.white)
								.clipShape(Circle())
							
							Text(location.name)
								.fixedSize() // SwiftUI annotation resizing bug work around
						}
						.onTapGesture {
							viewModel.selectedPlace = location
						}
					}
				}
				.ignoresSafeArea()
				
				Circle()
					.fill(.blue)
					.opacity(0.3)
					.frame(width: 32, height: 32)
				
				VStack {
					Spacer()
					
					HStack {
						Spacer()
						Button {
							viewModel.addLocation()
						} label: {
							Image(systemName: "plus")
								.padding()
								.background(.black.opacity(0.75))
								.foregroundColor(.white)
								.font(.title)
								.clipShape(Circle())
								.padding(.trailing)
						}
						
					}
				}
			}
			.sheet(item: $viewModel.selectedPlace) { place in
				EditView(location: place) { newLoaction in
					viewModel.updateLocation(location: newLoaction)
				}
			}
		} else {
			Button("Unlock places") {
				viewModel.authendicate()
			}
			.padding()
			.background(.blue)
			.foregroundColor(.white)
			.clipShape(Capsule())
			
			.alert(viewModel.authendicationAlertMessage, isPresented: $viewModel.showAuthendicationAlert) {
				Button("OK") { }
			}
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}

