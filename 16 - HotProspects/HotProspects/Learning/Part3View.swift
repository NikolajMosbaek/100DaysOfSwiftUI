//
//  Part3View.swift
//  HotProspects
//
//  Created by Nikolaj Søgaard Simonsen on 01/04/2022.
//

import SwiftUI

@MainActor class DelayedUpdater: ObservableObject {
	var value = 0 {
		willSet {
			objectWillChange.send()
		}
	}
	
	init() {
		for i in 1...10 {
			DispatchQueue.main.asyncAfter(deadline: .now() + Double(i)) {
				self.value += 1
			}
		}
	}
}

struct Part3View: View {
	@StateObject private var updater = DelayedUpdater()
	
    var body: some View {
		Text("Value is \(updater.value)")
    }
}

struct Part3View_Previews: PreviewProvider {
    static var previews: some View {
        Part3View()
    }
}
