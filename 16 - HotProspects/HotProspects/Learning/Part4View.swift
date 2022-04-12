//
//  Part4View.swift
//  HotProspects
//
//  Created by Nikolaj Søgaard Simonsen on 01/04/2022.
//

import SwiftUI

struct Part4View: View {
	@State private var output = ""
	
    var body: some View {
        Text(output)
			.task {
				await fetchReadings()
			}
    }
	
	func fetchReadings() async {
		let fetchTask = Task { () -> String in
			let url = URL(string: "https://hws.dev/readings.json")!
			let (data, _) = try await URLSession.shared.data(from: url)
			let readings = try JSONDecoder().decode([Double].self, from: data)
			return "Found \(readings.count) readings"
		}
		
		let result = await fetchTask.result
		
		switch result {
		case .success(let str):
			output = str
			
		case .failure(let error):
			output = "Download error: \(error.localizedDescription)"
		}
//		do {
//			output = try result.get()
//		} catch {
//			print("Download error")
//		}
	}
}

struct Part4View_Previews: PreviewProvider {
    static var previews: some View {
        Part4View()
    }
}
