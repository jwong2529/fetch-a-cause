import SwiftUI
import Firebase

struct EventCard: View {
    let eventName: String
    let description: String
    let backgroundColor: Color
    let actionColor: Color
    let date: String
    let time: String
    let orgName: String
    let id: Int // Event ID (as Integer)
    var showArrow: Bool = false
    
    @State private var showAlert = false // To control the alert visibility
        
    func addVolunteerOpportunityToUser() {
        // Get a reference to the Firebase database
        let databaseRef = Database.database().reference()
        
        // Reference to the "users" node and their volunteering opportunities
        let userRef = databaseRef.child("users").child("defaultUser") // Assuming "defaultUser"
        
        // Get the current user's volunteering opportunities
        userRef.child("volunteeringOpportunities").observeSingleEvent(of: .value) { snapshot in
            var opportunities = snapshot.value as? [[String: Any]] ?? [] // Now it's an array of dictionaries with id and timestamp
            
            // Add the event ID and timestamp to the user's opportunities list
            let eventIDString = String(id)
            let timestamp = ISO8601DateFormatter().string(from: Date()) // ISO 8601 formatted timestamp
            
            // Add a dictionary with both ID and timestamp
            opportunities.append([
                "id": eventIDString,
                "timestamp": timestamp
            ])
            
            // Update the user's opportunities in Firebase
            userRef.child("volunteeringOpportunities").setValue(opportunities) { error, _ in
                if let error = error {
                    print("Error adding volunteer opportunity: \(error.localizedDescription)")
                } else {
                    print("Volunteer opportunity added successfully!")
                }
            }
        }
    }

    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            VStack(alignment: .leading, spacing: 8) {
                Text(eventName)
                    .font(.custom("Rubik-Regular", size: 20))
                    .lineSpacing(0)
                    .foregroundColor(.black)

                Text(description)
                    .font(.custom("Rubik-Regular", size: 12))
                    .lineSpacing(4)
                    .foregroundColor(.black)
                
                // Event Date & Time
                HStack {
                    Text(date)
                        .font(.custom("Rubik-Regular", size: 12))
                        .foregroundColor(.gray)
                    Text("•")
                        .foregroundColor(.gray)
                    Text(time)
                        .font(.custom("Rubik-Regular", size: 12))
                        .foregroundColor(.gray)
                }
                
                // Organization Name
                Text("Organized by: \(orgName)")
                    .font(.custom("Rubik-Regular", size: 12))
                    .foregroundColor(.gray)

                HStack(spacing: 7) {
                    Text("Join Now")
                        .font(.custom("Rubik-Bold", size: 20)) // Bold text
                        .foregroundColor(actionColor)
                        .onTapGesture {
                            // Show alert
                            showAlert = true
                            
                            // Add the event ID to the user's volunteering opportunities
                            addVolunteerOpportunityToUser()
                        }

                    if showArrow {
                        AsyncImage(url: URL(string: "https://cdn.builder.io/api/v1/image/assets/TEMP/2ec7c1c58ad0c9692b875e19ac0adff656844bbd55c10de246d1959a3bb758d3?placeholderIfAbsent=true&apiKey=4822da42d44648d1bf97a175a2e7cb62&format=webp")) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        } placeholder: {
                            Color.clear
                        }
                        .frame(width: 20, height: 20)
                    }
                }
                .padding(.top, 8)
            }

            Spacer()
        }
        .padding(.horizontal, 25)
        .padding(.vertical, 14)
        .background(backgroundColor)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.cardBorder, lineWidth: 1)
        )
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Thank You for Volunteering"),
                message: Text("Thank you for volunteering with \(orgName)."),
                dismissButton: .default(Text("OK"))
            )
        }
    }
}

