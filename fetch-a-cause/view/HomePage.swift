import SwiftUI

struct HomePage: View {
    // Declare a state variable to hold the parsed opportunities (optional, to observe data changes)
    @State private var opportunities: [VolunteeringOpportunity] = []

    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                VStack(alignment: .leading, spacing: 0) {
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

                    // Categories Section
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Categories")
                            .font(.custom("Rubik", size: 18))
                            .fontWeight(.medium)
                            .foregroundColor(Color(red: 29/255, green: 26/255, blue: 32/255))
                            .padding(.horizontal, 20)
                            .padding(.top, 20)

                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 16) {
                                CategoryCard(
                                    image: "https://cdn.builder.io/api/v1/image/assets/TEMP/1506f8007976343274f492d9fabab3a7846c0c0e2867f0c6febd80ad7fa4d35b?placeholderIfAbsent=true&apiKey=4822da42d44648d1bf97a175a2e7cb62",
                                    title: "Food Security",
                                    backgroundColor: Color(red: 227/255, green: 237/255, blue: 251/255)
                                )

                                CategoryCard(
                                    image: "https://cdn.builder.io/api/v1/image/assets/TEMP/deb9814689af20c035d55cd2e01b78f01107e3380a1250141a990dd5c78a8a32?placeholderIfAbsent=true&apiKey=4822da42d44648d1bf97a175a2e7cb62",
                                    title: "Sports and Recreation",
                                    backgroundColor: Color(red: 244/255, green: 232/255, blue: 249/255)
                                )
                            }
                            .padding(.horizontal, 20)
                            .padding(.top, 24)
                        }
                    }
                    .padding(.bottom, 10)

                    // Activity Post
                    ActivityPost(
                        profileImage: "https://cdn.builder.io/api/v1/image/assets/TEMP/12c2a92bea91916d45c8c65927581d197d3371bd73b1291dbaab1be953fcd1e1?placeholderIfAbsent=true&apiKey=4822da42d44648d1bf97a175a2e7cb62",
                        username: "Janice Wong",
                        action: "earned a new badge",
                        timeAgo: "44 min ago",
                        postImage: "https://cdn.builder.io/api/v1/image/assets/TEMP/74676895ef1321b05dbb59956070fc81d18dfc93b9b6a6fbfd58eec4e1616764?placeholderIfAbsent=true&apiKey=4822da42d44648d1bf97a175a2e7cb62"
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
            // Parse the CSV file and upload the opportunities to Firebase when the page appears
//            if let opportunities = parseCSV(fileName: "Volunteer Mock Data") {
//                uploadVolunteeringOpportunities(opportunities: opportunities)
//            }
            if let opportunities = DataManager().parseTSV(fileName: "Volunteer Mock Data") {
                print("Parsed opportunities: \(opportunities)") // Debug print
//                DataManager().uploadVolunteeringOpportunities(opportunities: opportunities)
            } else {
                print("Failed to parse CSV.")
            }
        }
    }
}
