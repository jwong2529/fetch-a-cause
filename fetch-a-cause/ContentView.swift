import SwiftUI

struct ContentView: View {
    @State private var selectedOpportunity: VolunteeringOpportunity? = nil

    let sampleOpportunities = [
        VolunteeringOpportunity(id: 1, org_name: "Beach Cleanup", category: "Environment", date: "March 5, 2025", time: "10:00 AM - 1:00 PM", description: "Join us to clean up the beach and protect marine life.", link: "https://volunteer.org/beach-cleanup", latitude: 34.0219, longitude: -118.4814),
        
        VolunteeringOpportunity(id: 2, org_name: "Food Bank Support", category: "Hunger Relief", date: "March 8, 2025", time: "9:00 AM - 12:00 PM", description: "Help distribute food to those in need at the local food bank.", link: "https://volunteer.org/food-bank", latitude: 34.0407, longitude: -118.2468)
    ]

    var body: some View {
        ZStack {
            MapViewRepresentable(opportunities: sampleOpportunities, selectedOpportunity: $selectedOpportunity)
                .edgesIgnoringSafeArea(.all)
        }
        .sheet(item: $selectedOpportunity) { opportunity in
            OpportunityDetailView(opportunity: opportunity)
        }
    }
}
