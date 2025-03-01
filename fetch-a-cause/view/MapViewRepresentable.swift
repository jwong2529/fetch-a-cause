import SwiftUI
import MapboxMaps

struct MapViewRepresentable: UIViewRepresentable {
    var opportunities: [VolunteeringOpportunity]
    @Binding var selectedOpportunity: VolunteeringOpportunity?

    func makeUIView(context: Context) -> MapView {
        let initialCamera = CameraOptions(center: CLLocationCoordinate2D(latitude: 34.0522, longitude: -118.2437), zoom: 10.0)
        let mapInitOptions = MapInitOptions(cameraOptions: initialCamera)
        let mapView = MapView(frame: .zero, mapInitOptions: mapInitOptions)

        let annotationManager = mapView.annotations.makePointAnnotationManager()
        annotationManager.delegate = context.coordinator
        addAnnotations(to: annotationManager)

        return mapView
    }

    func updateUIView(_ uiView: MapView, context: Context) {
        // Optional: Update map if new volunteering opportunities are added
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    private func addAnnotations(to manager: PointAnnotationManager) {
        var pointAnnotations = [PointAnnotation]()

        for opportunity in opportunities {
            let coordinate = CLLocationCoordinate2D(latitude: opportunity.latitude, longitude: opportunity.longitude)
            var pointAnnotation = PointAnnotation(coordinate: coordinate)

            // Store opportunity details in userInfo for later retrieval
            pointAnnotation.userInfo = [
                "id": opportunity.id,
                "org_name": opportunity.org_name,
                "category": opportunity.category,
                "date": opportunity.date,
                "time": opportunity.time,
                "description": opportunity.description,
                "link": opportunity.link,
                "latitude": opportunity.latitude,
                "longitude": opportunity.longitude
            ]

            pointAnnotations.append(pointAnnotation)
        }

        manager.annotations = pointAnnotations
    }

    class Coordinator: NSObject, AnnotationInteractionDelegate {
        var parent: MapViewRepresentable

        init(_ parent: MapViewRepresentable) {
            self.parent = parent
        }

        func annotationManager(_ manager: AnnotationManager, didDetectTappedAnnotations annotations: [Annotation]) {
            guard let annotation = annotations.first as? PointAnnotation,
                  let userInfo = annotation.userInfo,
                  let id = userInfo["id"] as? Int,
                  let org_name = userInfo["org_name"] as? String,
                  let category = userInfo["category"] as? String,
                  let date = userInfo["date"] as? String,
                  let time = userInfo["time"] as? String,
                  let description = userInfo["description"] as? String,
                  let link = userInfo["link"] as? String,
                  let latitude = userInfo["latitude"] as? Double,
                  let longitude = userInfo["longitude"] as? Double else {
                return
            }

            DispatchQueue.main.async {
                self.parent.selectedOpportunity = VolunteeringOpportunity(
                    id: id, org_name: org_name, category: category, date: date,
                    time: time, description: description, link: link,
                    latitude: latitude, longitude: longitude
                )
            }
        }
    }
}
