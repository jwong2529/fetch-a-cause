//
//  MapView.swift
//  fetch-a-cause
//
//  Created by Janice Wong on 3/1/25.
//

import SwiftUI
import MapboxMaps

struct MapView: UIViewRepresentable {
    let opportunities: [VolunteeringOpportunity]

    func makeUIView(context: Context) -> MapboxMaps.MapView {
        let options = MapInitOptions(cameraOptions: CameraOptions(center: CLLocationCoordinate2D(latitude: 34.0558, longitude: -118.2445), zoom: 10.0))
        let mapView = MapboxMaps.MapView(frame: .zero, mapInitOptions: options)
        
        mapView.mapboxMap.loadStyle(.standard) { _ in
            addMarkers(mapView: mapView, opportunities: opportunities)
        }

        return mapView
    }

    func updateUIView(_ uiView: MapboxMaps.MapView, context: Context) {
        addMarkers(mapView: uiView, opportunities: opportunities)
    }

    private func addMarkers(mapView: MapboxMaps.MapView, opportunities: [VolunteeringOpportunity]) {
        do {
            let features = opportunities.map { opportunity in
                Feature(geometry: .point(Point(CLLocationCoordinate2D(latitude: opportunity.latitude, longitude: opportunity.longitude))))
            }
            
            let geoJSON = FeatureCollection(features: features)
            var source = GeoJSONSource(id: "source_id")
            source.data = .featureCollection(geoJSON)
            try mapView.mapboxMap.addSource(source)

            var layer = SymbolLayer(id: "layer_id", source: "source_id")
            layer.iconImage = .constant(.name("marker_icon"))
            try mapView.mapboxMap.addLayer(layer)

            try mapView.mapboxMap.addImage(UIImage(named: "dest-pin")!, id: "marker_icon")
        } catch {
            print("Error adding markers: \(error)")
        }
    }
}
