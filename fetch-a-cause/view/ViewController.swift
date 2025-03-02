////
////  ViewController.swift
////  fetch-a-cause
////
////  Created by Janice Wong on 3/1/25.
////
//
//import UIKit
//import MapboxMaps
//import FirebaseDatabase
//
//final class ViewController: UIViewController {
//    private lazy var mapView: MapView = {
//        let options = MapInitOptions(cameraOptions: CameraOptions(center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194), zoom: 10.0))
//        return MapView(frame: view.bounds, mapInitOptions: options)
//    }()
//
//    private let databaseRef = Database.database().reference()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        view.addSubview(mapView)
//
//        mapView.mapboxMap.loadStyle(.standard) { [weak self] error in
//            guard error == nil else { return }
//            self?.fetchAndAddMarkers()
//        }
//    }
//
//    private func fetchAndAddMarkers() {
//        databaseRef.child("volunteering_opportunities").observeSingleEvent(of: .value) { snapshot in
//            guard let data = snapshot.value as? [String: [String: Any]] else {
//                print("No data found in Firebase")
//                return
//            }
//
//            var features: [Feature] = []
//
//            for (_, value) in data {
//                if let latitude = value["latitude"] as? Double,
//                   let longitude = value["longitude"] as? Double {
//                    
//                    let point = Point(CLLocationCoordinate2D(latitude: latitude, longitude: longitude))
//                    let feature = Feature(geometry: .point(point))
//                    features.append(feature)
//                }
//            }
//
//            self.addMarkersToMap(features: features)
//        }
//    }
//
//    private func addMarkersToMap(features: [Feature]) {
//        do {
//            let geoJSON = FeatureCollection(features: features)
//            var source = GeoJSONSource(id: Constants.SOURCE_ID)
//            source.data = .featureCollection(geoJSON)
//            try mapView.mapboxMap.addSource(source)
//
//            var layer = SymbolLayer(id: Constants.LAYER_ID, source: Constants.SOURCE_ID)
//            layer.iconImage = .constant(.name(Constants.RED_ICON_ID))
//            layer.iconAnchor = .constant(.bottom)
//            layer.iconOffset = .constant([0, 12])
//            try mapView.mapboxMap.addLayer(layer)
//
//            try mapView.mapboxMap.addImage(UIImage(named: "dest-pin")!, id: Constants.RED_ICON_ID)
//        } catch {
//            print("Error adding markers to map: \(error)")
//        }
//    }
//}
//
//extension ViewController {
//    private enum Constants {
//        static let RED_ICON_ID = "red"
//        static let SOURCE_ID = "source_id"
//        static let LAYER_ID = "layer_id"
//    }
//}
