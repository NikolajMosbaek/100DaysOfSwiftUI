//
//  Part5View.swift
//  LayoutAndGeometry
//
//  Created by Nikolaj Søgaard Simonsen on 22/04/2022.
//

import SwiftUI

struct Part5View: View {
	let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]
	
	var body: some View {
		ScrollView(.horizontal, showsIndicators: false) {
			HStack(spacing: 0) {
				ForEach(1..<20) { num in
					GeometryReader { geo in
						Text("Number \(num)")
							.font(.largeTitle)
							.padding()
							.background(.red)
							.rotation3DEffect(.degrees(-geo.frame(in: .global).minX) / 8, axis: (x: 0, y: 1, z: 0))
							.frame(width: 200, height: 200)
					}
					.frame(width: 200, height: 200)
				}
			}
		}
		
//		GeometryReader { fullView in
//			ScrollView {
//				ForEach(0..<50) { index in
//					GeometryReader { geo in
//						Text("Row #\(index)")
//							.font(.title)
//							.frame(maxWidth: .infinity)
//							.background(colors[index % 7])
//							.rotation3DEffect(.degrees(geo.frame(in: .global).minY - fullView.size.height / 2) / 5, axis: (x: 0, y: 1, z: 0))
//					}
//					.frame(height: 40)
//				}
//			}
//		}
	}
}

struct Part5View_Previews: PreviewProvider {
    static var previews: some View {
        Part5View()
    }
}
