//
//  Part2View.swift
//  Bookworm
//
//  Created by Nikolaj Søgaard Mosbæk Nielsen on 17/02/2022.
//

import SwiftUI

struct Part2View: View {
    @AppStorage("notes") private var notes = ""
    
    var body: some View {
        NavigationView {
            TextEditor(text: $notes)
                .navigationTitle("Notes")
                .padding()
        }
    }
}

struct Part2View_Previews: PreviewProvider {
    static var previews: some View {
        Part2View()
    }
}
