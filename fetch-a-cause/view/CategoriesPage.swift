

import SwiftUI
import FirebaseDatabase

struct CategoriesPage: View {
    let categoryName: String
    @State private var opportunities: [VolunteeringOpportunity] = []
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                Text(categoryName) // Display the category name passed to the view
                    .font(.custom("Rubik-Bold", size: 30))
                    .foregroundColor(Color.primaryText)
                    .padding(.bottom, 13)

                Text("Events")
                    .font(.custom("Rubik-Regular", size: 22))
                    .foregroundColor(Color.primaryText)
                    .padding(.bottom, 43)

                VStack(spacing: 26) {
                    if opportunities.isEmpty {
                        Text("No events found for this category.")
                            .font(.custom("Rubik-Regular", size: 16))
                            .foregroundColor(Color.primaryText)
                    } else {
                        ForEach(opportunities, id: \.id) { opportunity in
                            EventCard(
                                eventName: opportunity.eventName,
                                description: opportunity.description,
                                backgroundColor: Color.white,
                                actionColor: Color.actionOrange,
                                date: opportunity.date,
                                time: opportunity.time,
                                orgName: opportunity.orgName,
                                id: opportunity.id
                            )
                        }
                    }
                }
            }
            .padding(.horizontal, 25)
            .padding(.vertical, 61)
            .background(Color.white)
            .cornerRadius(40)
        }
        .background(Color.white)
        .onAppear {
            // Fetch opportunities for the selected category when the view appears
            fetchOpportunitiesByCategory(categoryName: self.categoryName) { fetchedOpportunities in
                if let fetchedOpportunities = fetchedOpportunities {
                    DispatchQueue.main.async {
                        self.opportunities = fetchedOpportunities
                    }
                }
            }
        }
    }

    // Function to fetch opportunities based on category directly in CategoriesPage
    private func fetchOpportunitiesByCategory(categoryName: String, completion: @escaping ([VolunteeringOpportunity]?) -> Void) {
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
                        // Only add opportunities that match the category
                        if opportunity.category == categoryName {
                            opportunities.append(opportunity)
                        }
                    }
                }
            }
            
//            completion(opportunities)
            self.opportunities = opportunities
        }
    }
}
