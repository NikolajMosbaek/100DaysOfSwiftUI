//
//  Part1View.swift
//  Flashzilla
//
//  Created by Nikolaj Søgaard Simonsen on 11/04/2022.
//

import SwiftUI

struct Part1View: View {
//	@State private var currentAmount = Angle.zero //0
//	@State private var finalAmount = Angle.zero //0
	
	@State private var offset = CGSize.zero
	@State private var isDragging = false
	
    var body: some View {
		let dragGesture = DragGesture()
			.onChanged { value in
				offset = value.translation
			}
			.onEnded { _ in
				withAnimation {
					offset = .zero
					isDragging = false
				}
			}
		
		let pressGesture =  LongPressGesture()
			.onEnded { value in
				withAnimation {
					isDragging = true
				}
			}
		
		let combined = pressGesture.sequenced(before: dragGesture)
		
		Circle()
			.fill(.red)
			.frame(width: 64, height: 64)
			.scaleEffect(isDragging ? 1.5 : 1)
			.offset(offset)
			.gesture(combined)
		
//		VStack {
//			Text("Hello, World!")
//				.onTapGesture {
//					print("Text tapped")
//				}
//		}
//		.simultaneousGesture(
//			TapGesture()
//				.onEnded {
//					print("VStack tapped")
//				}
//		)
//		.highPriorityGesture(
//			TapGesture()
//				.onEnded {
//					print("VStack tapped")
//				}
//		)
		
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
		
//			.rotationEffect(currentAmount + finalAmount)
//			.gesture(
//				RotationGesture()
//					.onChanged { angle in
//						currentAmount = angle
//					}
//					.onEnded { angle in
//						finalAmount += currentAmount
//						currentAmount = .zero
//					}
//			)
		
//			.scaleEffect(finalAmount + currentAmount)
//			.gesture(
//				MagnificationGesture()
//					.onChanged { amount in
//						currentAmount = amount - 1
//					}
//					.onEnded { amount in
//						finalAmount += currentAmount
//						currentAmount = 0
//					}
//			)
		
//			.onLongPressGesture(minimumDuration: 2) {
//				print("Long pressed")
//			} onPressingChanged: { inProgress in
//				print("In progress: \(inProgress)")
//			}
    }
}

struct Part1View_Previews: PreviewProvider {
    static var previews: some View {
        Part1View()
    }
}
