//
//  Part2View.swift
//  Instafilter
//
//  Created by Nikolaj Søgaard Mosbæk Nielsen on 25/02/2022.
//

import SwiftUI

struct Part2View: View {
	@State private var showingConfirmation = false
	@State private var backgroundColor = Color.white
	
    var body: some View {
		Text("Hello World!")
			.frame(width: 300, height: 300)
			.background(backgroundColor)
			.onTapGesture {
				showingConfirmation = true
			}
			.confirmationDialog("Change background", isPresented: $showingConfirmation) {
				Button("Red") { backgroundColor = .red }
				Button("Green") { backgroundColor = .green }
				Button("Blue") { backgroundColor = .blue }
				Button("Cancel", role: .cancel) { }
			} message: {
				Text("Set a new color")
			}
    }
}

struct Part2View_Previews: PreviewProvider {
    static var previews: some View {
        Part2View()
    }
}
