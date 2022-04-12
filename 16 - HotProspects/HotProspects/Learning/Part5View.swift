//
//  Part5View.swift
//  HotProspects
//
//  Created by Nikolaj Søgaard Simonsen on 01/04/2022.
//

import SwiftUI

struct Part5View: View {
    var body: some View {
        Image("example")
			.interpolation(.none)
			.resizable()
			.scaledToFit()
			.frame(maxHeight: .infinity)
			.background(.black)
			.ignoresSafeArea()
    }
}

struct Part5View_Previews: PreviewProvider {
    static var previews: some View {
        Part5View()
    }
}
