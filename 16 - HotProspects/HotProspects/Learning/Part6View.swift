//
//  Part6View.swift
//  HotProspects
//
//  Created by Nikolaj Søgaard Simonsen on 01/04/2022.
//

import SwiftUI

struct Part6View: View {
	@State private var backgroundColor = Color.red
	
    var body: some View {
		VStack {
			Text("Hello World!")
				.padding()
				.background(backgroundColor)
			
			Text("Change color")
				.padding()
				.contextMenu {
					Button(role: .destructive) {
						backgroundColor = .red
					} label: {
						Label("Red", systemImage: "checkmark.circle.fill")
					}
					
					Button("Green") {
						backgroundColor = .green
					}
					
					Button("Blue") {
						backgroundColor = .blue
					}
				}
		}
    }
}

struct Part6View_Previews: PreviewProvider {
    static var previews: some View {
        Part6View()
    }
}
