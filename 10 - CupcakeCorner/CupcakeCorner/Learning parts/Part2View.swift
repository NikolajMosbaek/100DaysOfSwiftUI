//
//  Part2View.swift
//  CupcakeCorner
//
//  Created by Nikolaj Søgaard Mosbæk Nielsen on 15/02/2022.
//

import SwiftUI

struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}

struct Part2View: View {
    @State private var results = [Result]()
    
    var body: some View {
        NavigationView {
            List(results, id: \.trackId) { item in
                VStack(alignment: .leading) {
                    Text(item.trackName)
                        .font(.headline)
                    Text(item.collectionName)
                }
            }
            .task {
                await loadData()
            }
        }
        .navigationTitle("Part 2")
        .toolbar {
            NavigationLink("Part 3") {
                Part3View()
            }
        }
    }
    
    func loadData() async {
        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                results = decodedResponse.results
            }
        } catch {
            print("Invalid data")
        }
    }
}

struct Part2View_Previews: PreviewProvider {
    static var previews: some View {
        Part2View()
    }
}
