//
//  Part6View.swift
//  Flashzilla
//
//  Created by Nikolaj Søgaard Simonsen on 12/04/2022.
//

import SwiftUI

func withOptionalAnimation<Result>(_ animation: Animation? = .default, _ body: () throws -> Result) rethrows -> Result {
	if UIAccessibility.isReduceMotionEnabled {
		return try body()
	} else {
		return try withAnimation(animation, body)
	}
}

struct Part6View: View {
//	@Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
//	@Environment(\.accessibilityReduceMotion) var reduceMotion
	@Environment(\.accessibilityReduceTransparency) var reduceTransparency
//	@State private var scale = 1.0
	
    var body: some View {
		Text("Hello, World!")
			.background(reduceTransparency ? .black : .black.opacity(0.5))
			.foregroundColor(.white)
			.clipShape(Capsule())
//			.scaleEffect(scale)
//			.onTapGesture {
//				withOptionalAnimation {
//					scale *= 1.5
//				}
//			}
		
//		HStack {
//			if differentiateWithoutColor {
//				Image(systemName: "checkmark.circle")
//			}
//
//			Text("Success")
//		}
//		.padding()
//		.background(differentiateWithoutColor ? .black : .green)
//		.foregroundColor(.white)
//		.clipShape(Capsule())
    }
}

struct Part6View_Previews: PreviewProvider {
    static var previews: some View {
        Part6View()
    }
}
