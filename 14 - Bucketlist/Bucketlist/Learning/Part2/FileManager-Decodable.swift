//
//  FileManager-Decodable.swift
//  Bucketlist
//
//  Created by Nikolaj Søgaard Mosbæk Nielsen on 02/03/2022.
//

import Foundation

enum FileManagerDecoderError: Error {
	case readError
	case decodeError
}

enum FileManagerEncoderError: Error {
	case encodeError
}

extension FileManager {
	static func urlFor(filename: String) -> URL {
		let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
		return paths.first!.appendingPathComponent(filename)
	}
	
	static func decode<T: Decodable>(filename: String) throws -> T {
		let url = urlFor(filename: filename)
		
		guard let data = try? Data(contentsOf: url) else {
			throw FileManagerDecoderError.readError
		}
		
		guard let loaded = try? JSONDecoder().decode(T.self, from: data) else {
			throw FileManagerDecoderError.decodeError
		}
		
		return loaded
	}
	
	static func encode<T: Encodable>(_ value: T, withFilename filename: String) throws {
		let url = urlFor(filename: filename)
		
		guard let encoded = try? JSONEncoder().encode(value) else {
			throw FileManagerEncoderError.encodeError
		}
		
		try encoded.write(to: url)
	}
}
