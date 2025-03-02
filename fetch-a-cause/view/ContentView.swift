//import SwiftUI
//
//struct ContentView: View {
//    var body: some View {
//        MapViewRepresentable()
//            .edgesIgnoringSafeArea(.all)
//    }
//}



import SwiftUI
import FirebaseDatabase

struct ContentView: View {
    @State private var opportunities: [VolunteeringOpportunity] = []
    private let databaseRef = Database.database().reference()

    var body: some View {
        VStack {
            if opportunities.isEmpty {
                Text("Loading locations...")
            } else {
                MapView(opportunities: opportunities)
                    .edgesIgnoringSafeArea(.all)
            }
        }
        .onAppear {
            fetchVolunteeringOpportunities { fetchedOpportunities in
                if let fetchedOpportunities = fetchedOpportunities {
                    DispatchQueue.main.async {
                        self.opportunities = fetchedOpportunities
                    }
                }
            }
        }
    }

    func fetchVolunteeringOpportunities(completion: @escaping ([VolunteeringOpportunity]?) -> Void) {
        let ref = Database.database().reference().child("volunteering_opportunities")
        
        ref.observeSingleEvent(of: .value) { snapshot in
            var opportunities: [VolunteeringOpportunity] = []
            
            for child in snapshot.children {
                if let snapshot = child as? DataSnapshot,
                   let dict = snapshot.value as? [String: Any] {
                    // Parse the dictionary into a VolunteeringOpportunity object
                    if let id = Int(snapshot.key),
                       let orgName = dict["orgName"] as? String,
                       let eventName = dict["eventName"] as? String,
                       let category = dict["category"] as? String,
                       let date = dict["date"] as? String,
                       let time = dict["time"] as? String,
                       let description = dict["description"] as? String,
                       let link = dict["link"] as? String,
                       let latitude = dict["latitude"] as? Double,
                       let longitude = dict["longitude"] as? Double {
                        let opportunity = VolunteeringOpportunity(
                            id: id,
                            orgName: orgName,
                            eventName: eventName,
                            category: category,
                            date: date,
                            time: time,
                            description: description,
                            link: link,
                            latitude: latitude,
                            longitude: longitude
                        )
                        opportunities.append(opportunity)
                    }
                }
            }
            
            completion(opportunities)
        }
    }
}
