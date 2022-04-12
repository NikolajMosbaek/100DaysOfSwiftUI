//
//  Part4View.swift
//  Flashzilla
//
//  Created by Nikolaj Søgaard Simonsen on 12/04/2022.
//

import SwiftUI

struct Part4View: View {
	let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
	let now = Date.now
	
	@State private var counter = 0
	
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
			.onReceive(timer) { time in
				if counter == 120 {
					timer.upstream.connect().cancel()
				} else {
					let timeFormat = secondsToHoursMinutesSeconds(Int(time.timeIntervalSince(now)))
					
					print("Time passed: \(timeFormat.0) hours, \(timeFormat.1) minutes, \(timeFormat.2) seconds")
				}
				counter += 1
			}
    }
	
	func secondsToHoursMinutesSeconds(_ seconds: Int) -> (Int, Int, Int) {
		return (seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
	}
}

struct Part4View_Previews: PreviewProvider {
    static var previews: some View {
        Part4View()
    }
}
