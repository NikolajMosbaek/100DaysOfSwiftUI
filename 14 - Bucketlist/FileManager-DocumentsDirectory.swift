//
//  FileManager-DocumentsDirectory.swift
//  Bucketlist
//
//  Created by Nikolaj Søgaard Simonsen on 03/03/2022.
//

import Foundation

extension FileManager {
	static var documentsDirectory: URL {
		let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
		return paths.first!
	}
}
