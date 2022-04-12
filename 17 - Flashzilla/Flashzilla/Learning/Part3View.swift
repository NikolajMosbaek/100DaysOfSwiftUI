//
//  Part3View.swift
//  Flashzilla
//
//  Created by Nikolaj Søgaard Simonsen on 11/04/2022.
//

import SwiftUI

struct Part3View: View {
    var body: some View {
		VStack {
			Text("Hello")
			Spacer()
				.frame(height: 100)
			Text("World")
		}
		.contentShape(Rectangle())
		.onTapGesture {
			print("VStack tapped")
		}
		
//		ZStack {
//			Rectangle()
//				.fill(.blue)
//				.frame(width: 300, height: 300)
//				.onTapGesture {
//					print("Rectangle tapped!")
//				}
//
//			Circle()
//				.fill(.red)
//				.frame(width: 300, height: 300)
//				.contentShape(Rectangle())
//				.onTapGesture {
//					print("Circle tapped!")
//				}
////				.allowsHitTesting(false)
//		}
    }
}

struct Part3View_Previews: PreviewProvider {
    static var previews: some View {
        Part3View()
    }
}
