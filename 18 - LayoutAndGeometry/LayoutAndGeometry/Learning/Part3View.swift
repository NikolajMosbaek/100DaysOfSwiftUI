//
//  Part3View.swift
//  LayoutAndGeometry
//
//  Created by Nikolaj Søgaard Simonsen on 22/04/2022.
//

import SwiftUI

struct Part3View: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
			.background(.red)
//			.position(x: 100, y: 100)
			.offset(x: 100, y: 100)
			.background(.blue)
    }
}

struct Part3View_Previews: PreviewProvider {
    static var previews: some View {
        Part3View()
    }
}
