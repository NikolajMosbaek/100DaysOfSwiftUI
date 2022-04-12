//
//  Part2View.swift
//  Bucketlist
//
//  Created by Nikolaj Søgaard Mosbæk Nielsen on 02/03/2022.
//

import SwiftUI

struct Part2View: View {
    var body: some View {
		Text("Hello World")
			.onTapGesture {
				let str = "Test message"
				
				do {
					try FileManager.encode(str, withFilename: "test.txt")
				} catch {
					print(error.localizedDescription)
				}
				
				do {
					let s: String = try FileManager.decode(filename: "test.txt")
					print("Loaded \(s)")
				} catch {
					print(error.localizedDescription)
				}
			}
    }
}

struct Part2View_Previews: PreviewProvider {
    static var previews: some View {
        Part2View()
    }
}
