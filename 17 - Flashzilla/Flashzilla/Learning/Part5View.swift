//
//  Part5View.swift
//  Flashzilla
//
//  Created by Nikolaj Søgaard Simonsen on 12/04/2022.
//

import SwiftUI

struct Part5View: View {
	@Environment(\.scenePhase) var scenePhase
	
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
			.padding()
			.onChange(of: scenePhase) { newPhase in
				if newPhase == .active {
					print("Active")
				} else if newPhase == .inactive {
					print("Inactive")
				} else if newPhase == .background {
					print("Background")
				}
			}
    }
}

struct Part5View_Previews: PreviewProvider {
    static var previews: some View {
        Part5View()
    }
}
