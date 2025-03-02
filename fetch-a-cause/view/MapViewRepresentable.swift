import SwiftUI
import MapboxMaps

struct MapViewRepresentable: UIViewRepresentable {
    func makeUIView(context: Context) -> MapView {
        let mapView = MapView(frame: .zero)

        // Set initial camera position
        let cameraOptions = CameraOptions(center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194), zoom: 10.0)
        mapView.mapboxMap.setCamera(to: cameraOptions)

        return mapView
    }

    func updateUIView(_ uiView: MapView, context: Context) {
        // No need to update for now
    }
}



