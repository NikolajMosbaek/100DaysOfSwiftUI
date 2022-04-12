//
//  Part3View.swift
//  CupcakeCorner
//
//  Created by Nikolaj Søgaard Mosbæk Nielsen on 15/02/2022.
//

import SwiftUI

struct Part3View: View {
    var body: some View {
        NavigationView {
            VStack {
                AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 200, height: 200)
                
                AsyncImage(url: URL(string: "https://hws.dev/img/bad.png")) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFit()
                    } else if phase.error != nil {
                        Text("There was an error loading the image.")
                    } else {
                        ProgressView()
                    }
                }
                .frame(width: 200, height: 200)
            }
        }
        .navigationTitle("Part 3")
        .toolbar {
            NavigationLink("Part 4") {
                Part4View()
            }
        }
    }
}

struct Part3View_Previews: PreviewProvider {
    static var previews: some View {
        Part3View()
    }
}
