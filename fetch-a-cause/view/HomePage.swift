//
//import SwiftUI
//import FirebaseDatabase
//
//struct HomePage: View {
////    @State private var opportunities: [VolunteeringOpportunity] = []
//    @State private var opportunities: [(opportunity: VolunteeringOpportunity, timestamp: TimeInterval)] = []
//    @StateObject private var userManager = UserManager()
//    
//    private let categories: [(String, String, Color)] = [
//        ("Food Security", "FoodSecurity", Color(red: 227/255, green: 237/255, blue: 251/255)),
//        ("Health and Medicine", "Health&Medicine", Color(red: 244/255, green: 232/255, blue: 249/255)),
//        ("Environmental Conservation", "EnvironmentalConservation", Color(red: 230/255, green: 250/255, blue: 234/255)),
//        ("Community Service", "CommunityService", Color(red: 255/255, green: 242/255, blue: 204/255)),
//        ("Social Services", "SocialServices", Color(red: 255/255, green: 224/255, blue: 224/255)),
//        ("Arts and Culture", "Arts&Culture", Color(red: 224/255, green: 245/255, blue: 255/255)),
//        ("Animal Welfare", "AnimalWelfare", Color(red: 224/255, green: 245/255, blue: 255/255))
//    ]
//    
//    var body: some View {
//        NavigationView {
//            ScrollView {
//                VStack(spacing: 0) {
//                    Text("Explore")
//                        .font(.custom("Rubik", size: 36))
//                        .fontWeight(.bold)
//                        .foregroundColor(Color(red: 29/255, green: 26/255, blue: 32/255))
//                        .padding(.horizontal, 20)
//                        .padding(.top, 44)
//                        .padding(.bottom, 8)
//                    
//                    SearchBar()
//                        .padding(.horizontal, 20)
//                        .padding(.vertical, 8)
//                    
//                    CategorySection(categories: categories)
//                    
////                    ActivityPost(
////                        profileImage: "https://cdn.builder.io/api/v1/image/assets/TEMP/12c2a92bea91916d45c8c65927581d197d3371bd73b1291dbaab1be953fcd1e1?placeholderIfAbsent=true&apiKey=4822da42d44648d1bf97a175a2e7cb62",
////                        username: "Janice Wong",
////                        action: "earned a new badge",
////                        timestamp: "44 min ago",
////                        postImage: "https://cdn.builder.io/api/v1/image/assets/TEMP/74676895ef1321b05dbb59956070fc81d18dfc93b9b6a6fbfd58eec4e1616764?placeholderIfAbsent=true&apiKey=4822da42d44648d1bf97a175a2e7cb62"
////                    )
////                    .padding(.top, 10)
////                    .padding(.bottom, 40)
//                    ForEach(opportunities, id: \.id) { opportunity in
//                        ActivityPost(
//                            profileImage: "https://cdn.builder.io/api/v1/image/assets/TEMP/12c2a92bea91916d45c8c65927581d197d3371bd73b1291dbaab1be953fcd1e1?placeholderIfAbsent=true&apiKey=4822da42d44648d1bf97a175a2e7cb62",
//                            username: "Janice Wong",
//                            action: "earned a new badge", // Adjust based on your needs
//                            timestamp: opportunity.date, // or another timestamp format
//                            postImage: "https://cdn.builder.io/api/v1/image/assets/TEMP/74676895ef1321b05dbb59956070fc81d18dfc93b9b6a6fbfd58eec4e1616764?placeholderIfAbsent=true&apiKey=4822da42d44648d1bf97a175a2e7cb62" // Adjust if you have post images in the data
//                        )
//                        .padding(.top, 10)
//                        .padding(.bottom, 40)
//                    }
//                }
//                .background(Color.white)
//                .cornerRadius(32)
//            }
//            .background(Color.white)
//            .frame(maxWidth: 480)
//            .onAppear {
//                fetchUserOpportunities()
//
//            }
//        }
//    }
//    
//    private func fetchUserOpportunities() {
//        let userRef = Database.database().reference().child("users").child("defaultUser").child("volunteeringOpportunities")
//        
//        userRef.observeSingleEvent(of: .value) { snapshot in
//            guard let opportunityData = snapshot.value as? [[String: Any]] else { return }
//            
//            var fetchedOpportunities: [(opportunity: VolunteeringOpportunity, timestamp: TimeInterval)] = []
//            let dispatchGroup = DispatchGroup()
//            let opportunitiesRef = Database.database().reference().child("volunteering_opportunities")
//            
//            for opportunity in opportunityData {
//                if let idString = opportunity["id"] as? String,
//                   let id = Int(idString),
//                   let timestampString = opportunity["timestamp"] as? String,
//                   let timestamp = ISO8601DateFormatter().date(from: timestampString)?.timeIntervalSince1970 {
//                    
//                    dispatchGroup.enter()
//                    opportunitiesRef.child(idString).observeSingleEvent(of: .value) { snapshot in
//                        if let opportunityDetails = snapshot.value as? [String: Any],
//                           let orgName = opportunityDetails["orgName"] as? String,
//                           let eventName = opportunityDetails["eventName"] as? String,
//                           let category = opportunityDetails["category"] as? String,
//                           let date = opportunityDetails["date"] as? String,
//                           let time = opportunityDetails["time"] as? String,
//                           let description = opportunityDetails["description"] as? String,
//                           let link = opportunityDetails["link"] as? String,
//                           let latitude = opportunityDetails["latitude"] as? Double,
//                           let longitude = opportunityDetails["longitude"] as? Double {
//                            
//                            let volunteeringOpportunity = VolunteeringOpportunity(
//                                id: id,
//                                orgName: orgName,
//                                eventName: eventName,
//                                category: category,
//                                date: date,
//                                time: time,
//                                description: description,
//                                link: link,
//                                latitude: latitude,
//                                longitude: longitude
//                            )
//                            // Store the pair of opportunity and user timestamp
//                            fetchedOpportunities.append((opportunity: volunteeringOpportunity, timestamp: timestamp))
//                        }
//                        dispatchGroup.leave()
//                    }
//                }
//            }
//            
//            dispatchGroup.notify(queue: .main) {
//                opportunities = fetchedOpportunities.sorted { $0.opportunity.date > $1.opportunity.date }
//                print(opportunities)
//            }
//        }
//    }
//    
//}
//
//struct CategorySection: View {
//    let categories: [(String, String, Color)]
//    
//    var body: some View {
//        VStack(alignment: .leading, spacing: 0) {
//            Text("Categories")
//                .font(.custom("Rubik", size: 18))
//                .fontWeight(.medium)
//                .foregroundColor(Color(red: 29/255, green: 26/255, blue: 32/255))
//                .padding(.horizontal, 20)
//                .padding(.top, 20)
//            
//            ScrollView(.horizontal, showsIndicators: false) {
//                HStack(spacing: 16) {
//                    ForEach(categories, id: \ .0) { category in
//                        NavigationLink(destination: CategoriesPage(categoryName: category.0)) {
//                            CategoryCard(
//                                image: category.1,
//                                title: category.0,
//                                backgroundColor: category.2
//                            )
//                        }
//                    }
//                }
//                .padding(.horizontal, 20)
//                .padding(.top, 24)
//            }
//        }
//        .padding(.bottom, 10)
//    }
//}
//


import SwiftUI
import FirebaseDatabase

struct HomePage: View {
    @State private var opportunities: [(opportunity: VolunteeringOpportunity, timestamp: TimeInterval)] = []
    @StateObject private var userManager = UserManager()
    
    private let categories: [(String, String, Color)] = [
        ("Food Security", "FoodSecurity", Color(red: 227/255, green: 237/255, blue: 251/255)),
        ("Health and Medicine", "Health&Medicine", Color(red: 244/255, green: 232/255, blue: 249/255)),
        ("Environmental Conservation", "EnvironmentalConservation", Color(red: 230/255, green: 250/255, blue: 234/255)),
        ("Community Service", "CommunityService", Color(red: 255/255, green: 242/255, blue: 204/255)),
        ("Social Services", "SocialServices", Color(red: 255/255, green: 224/255, blue: 224/255)),
        ("Arts and Culture", "Arts&Culture", Color(red: 224/255, green: 245/255, blue: 255/255)),
        ("Animal Welfare", "AnimalWelfare", Color(red: 224/255, green: 245/255, blue: 255/255))
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 0) {
                    Text("Explore")
                        .font(.custom("Rubik", size: 36))
                        .fontWeight(.bold)
                        .foregroundColor(Color(red: 29/255, green: 26/255, blue: 32/255))
                        .padding(.horizontal, 20)
                        .padding(.top, 44)
                        .padding(.bottom, 8)
                    
                    SearchBar()
                        .padding(.horizontal, 20)
                        .padding(.vertical, 8)
                    
                    CategorySection(categories: categories)
                    
                    ForEach(opportunities, id: \.opportunity.id) { pair in
                        ActivityPost(
                            profileImage: "https://cdn.builder.io/api/v1/image/assets/TEMP/12c2a92bea91916d45c8c65927581d197d3371bd73b1291dbaab1be953fcd1e1?placeholderIfAbsent=true&apiKey=4822da42d44648d1bf97a175a2e7cb62",
                            username: "Janice Wong",
                            action: "earned a new badge", // Adjust based on your needs
                            timestamp: pair.timestamp, // Pass the user timestamp here
                            opportunity: pair.opportunity,
                            postImage: getImageName(forCategory: pair.opportunity.category) ?? "Animal Welfare"
                        )
                        .padding(.top, 10)
                        .padding(.bottom, 40)
                    }
                }
                .background(Color.white)
                .cornerRadius(32)
            }
            .background(Color.white)
            .frame(maxWidth: 480)
            .onAppear {
                fetchUserOpportunities()
            }
            .refreshable {
                fetchUserOpportunities()
            }
        }
    }
    
    private func fetchUserOpportunities() {
        let userRef = Database.database().reference().child("users").child("defaultUser").child("volunteeringOpportunities")
        
        userRef.observeSingleEvent(of: .value) { snapshot in
            guard let opportunityData = snapshot.value as? [[String: Any]] else { return }
            
            var fetchedOpportunities: [(opportunity: VolunteeringOpportunity, timestamp: TimeInterval)] = []
            let dispatchGroup = DispatchGroup()
            let opportunitiesRef = Database.database().reference().child("volunteering_opportunities")
            
            for opportunity in opportunityData {
                if let idString = opportunity["id"] as? String,
                   let id = Int(idString),
                   let timestampString = opportunity["timestamp"] as? String,
                   let timestamp = ISO8601DateFormatter().date(from: timestampString)?.timeIntervalSince1970 {
                    
                    dispatchGroup.enter()
                    opportunitiesRef.child(idString).observeSingleEvent(of: .value) { snapshot in
                        if let opportunityDetails = snapshot.value as? [String: Any],
                           let orgName = opportunityDetails["orgName"] as? String,
                           let eventName = opportunityDetails["eventName"] as? String,
                           let category = opportunityDetails["category"] as? String,
                           let date = opportunityDetails["date"] as? String,
                           let time = opportunityDetails["time"] as? String,
                           let description = opportunityDetails["description"] as? String,
                           let link = opportunityDetails["link"] as? String,
                           let latitude = opportunityDetails["latitude"] as? Double,
                           let longitude = opportunityDetails["longitude"] as? Double {
                            
                            let volunteeringOpportunity = VolunteeringOpportunity(
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
                            // Store the pair of opportunity and user timestamp
                            fetchedOpportunities.append((opportunity: volunteeringOpportunity, timestamp: timestamp))
                        }
                        dispatchGroup.leave()
                    }
                }
            }
            
            dispatchGroup.notify(queue: .main) {
                // Sort opportunities based on the user timestamp (descending)
                opportunities = fetchedOpportunities.sorted { $0.timestamp > $1.timestamp }
                print(opportunities)
            }
        }
    }
    
    func getImageName(forCategory categoryName: String) -> String? {
        switch categoryName {
        case "Food Security":
            return "FoodSecurity"
        case "Health and Medicine":
            return "Health&Medicine"
        case "Environmental Conservation":
            return "EnvironmentalConservation"
        case "Community Service":
            return "CommunityService"
        case "Social Services":
            return "SocialServices"
        case "Arts and Culture":
            return "Arts&CultureImage"
        case "Animal Welfare":
            return "AnimalWelfare"
        default:
            return nil  // Return nil if no match is found
        }
    }
}

struct CategorySection: View {
    let categories: [(String, String, Color)]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Categories")
                .font(.custom("Rubik", size: 18))
                .fontWeight(.medium)
                .foregroundColor(Color(red: 29/255, green: 26/255, blue: 32/255))
                .padding(.horizontal, 20)
                .padding(.top, 20)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(categories, id: \ .0) { category in
                        NavigationLink(destination: CategoriesPage(categoryName: category.0)) {
                            CategoryCard(
                                image: category.1,
                                title: category.0,
                                backgroundColor: category.2
                            )
                        }
                    }
                }
                .padding(.horizontal, 20)
                .padding(.top, 24)
            }
        }
        .padding(.bottom, 10)
    }
}
