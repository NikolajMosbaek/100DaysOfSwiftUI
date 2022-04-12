//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Nikolaj Søgaard Mosbæk Nielsen on 15/02/2022.
//

import SwiftUI

class User: ObservableObject, Codable {
    enum CodingKeys: CodingKey {
        case name
    }
    
    @Published var name = "Nikolaj Simonsen"

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
    }
}

struct Part1View: View {
    var body: some View {
        NavigationView {
            Text("Hello, World!")
            
                .toolbar {
                    NavigationLink("Part 2") {
                        Part2View()
                    }
                }
                .navigationTitle("Part 1")
        }
        
    }
}

struct Part1View_Previews: PreviewProvider {
    static var previews: some View {
        Part1View()
    }
}
