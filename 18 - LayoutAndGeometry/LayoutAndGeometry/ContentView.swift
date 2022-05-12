//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Nikolaj Søgaard Simonsen on 21/04/2022.
//

import SwiftUI

struct ContentView: View {
	let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]
	
	var body: some View {
		GeometryReader { fullView in
			ScrollView(.vertical) {
				ForEach(0..<50) { index in
					GeometryReader { geo in
						Text("Row #\(index)")
							.font(.title)
							.frame(maxWidth: .infinity, maxHeight: geo.frame(in: .global).minY / fullView.size.height)
							.background(colors[index % 7])
							.rotation3DEffect(.degrees(geo.frame(in: .global).minY - fullView.size.height / 2) / 5, axis: (x: 0, y: 1, z: 0))
							.opacity((geo.frame(in: .global).minY - 100) / 50.0)
					}
					.frame(height: 40)
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
