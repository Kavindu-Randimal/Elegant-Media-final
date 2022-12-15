//
//  MapView.swift
//  Elegant Media
//
//  Created by Randimal Geeganage on 2022-12-15.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State private var region: MKCoordinateRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: MapDefaults.latitude, longitude: MapDefaults.longitude),
        span: MKCoordinateSpan(latitudeDelta: MapDefaults.zoom, longitudeDelta: MapDefaults.zoom))
    
    
    private enum MapDefaults {
        static let latitude = -60.964344
        static let longitude = -12.024244
        static let zoom = 0.5
    }
    
    var body: some View {
        VStack {
            Map(coordinateRegion: $region,
                interactionModes: .all,
                showsUserLocation: true)
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
