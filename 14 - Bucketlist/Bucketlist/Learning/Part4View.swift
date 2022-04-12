//
//  Part4View.swift
//  Bucketlist
//
//  Created by Nikolaj Søgaard Mosbæk Nielsen on 02/03/2022.
//

import MapKit
import SwiftUI

struct Location1: Identifiable {
	let id = UUID()
	let name: String
	let coordinate: CLLocationCoordinate2D
}

struct Part4View: View {
	@State private var mapRegion = MKCoordinateRegion(
		center: CLLocationCoordinate2D(latitude: 51.5, longitude: -0.12),
		span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
	)
	
	let locations = [
		Location1(name: "Buckingham Palace", coordinate: CLLocationCoordinate2D(latitude: 51.501, longitude: -0.141)),
		Location1(name: "Tower of London", coordinate: CLLocationCoordinate2D(latitude: 51.508, longitude: -0.076))
	]
	
    var body: some View {
		NavigationView {
			Map(coordinateRegion: $mapRegion, annotationItems: locations) { location in
				MapAnnotation(coordinate: location.coordinate) {
					NavigationLink {
						Text(location.name)
					} label: {
						Circle()
							.stroke(.red, lineWidth: 3)
							.frame(width: 44, height: 44)
					}
				}
			}
			.navigationTitle("London Explorer")
		}
    }
}

struct Part4View_Previews: PreviewProvider {
    static var previews: some View {
        Part4View()
    }
}
