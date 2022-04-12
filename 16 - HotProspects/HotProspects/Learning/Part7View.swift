//
//  Part7View.swift
//  HotProspects
//
//  Created by Nikolaj Søgaard Simonsen on 01/04/2022.
//

import SwiftUI

struct Part7View: View {
    var body: some View {
		List {
			Text("Taylor Swift")
				.swipeActions {
					Button(role: .destructive) {
						print("Deleting")
					} label: {
						Label("Delete", systemImage: "minus.circle")
					}
				}
				.swipeActions(edge: .leading) {
					Button {
						print("Pinning")
					} label: {
						Label("Pin", systemImage: "pin")
					}
					.tint(.orange)
				}
		}
    }
}

struct Part7View_Previews: PreviewProvider {
    static var previews: some View {
        Part7View()
    }
}
