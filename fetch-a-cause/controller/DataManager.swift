
import Foundation
import FirebaseDatabase

class DataManager {
    // Parse TSV file
    func parseTSV(fileName: String) -> [VolunteeringOpportunity]? {
        guard let path = Bundle.main.path(forResource: fileName, ofType: "tsv") else {
            print("TSV file not found.")
            return nil
        }

        do {
            // Read the file content with UTF-8 encoding
            let content = try String(contentsOfFile: path, encoding: .utf8)

            // Split the content by lines, handling both \n and \r\n
            let lines = content.components(separatedBy: .newlines).map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }

            // Initialize an empty array to store parsed opportunities
            var opportunities: [VolunteeringOpportunity] = []

            // Skip the header (first line)
            for line in lines.dropFirst() {
                // Skip empty lines
                if line.isEmpty {
                    continue
                }

                // Split the line by tab (\t) to separate the fields
                let fields = parseTSVLine(line)

                // Ensure that there are enough fields (10 columns)
                if fields.count == 10 {
                    // Parse each field, ensuring that latitude and longitude are converted correctly
                    if let id = Int(fields[0]),
                       let latitude = Double(fields[8]),
                       let longitude = Double(fields[9]) {
                        let opportunity = VolunteeringOpportunity(
                            id: id,
                            orgName: fields[1],                // Organization Name
                            eventName: fields[2],              // Event Name
                            category: fields[3],               // Category
                            date: fields[4],                   // Date
                            time: fields[5],                   // Time
                            description: fields[6],            // Description
                            link: fields[7],                   // Link
                            latitude: latitude,                // Latitude
                            longitude: longitude               // Longitude
                        )
                        opportunities.append(opportunity)
                    } else {
                        print("Error parsing row (id or lat/long): \(line)")
                    }
                } else {
                    print("Skipping invalid row (not 10 columns): \(line)")
                }
            }

            return opportunities
        } catch {
            print("Error reading TSV file: \(error)")
            return nil
        }
    }

    // Custom TSV line parser to handle tab-separated values
    func parseTSVLine(_ line: String) -> [String] {
        return line.components(separatedBy: "\t").map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
    }

    func uploadVolunteeringOpportunities(opportunities: [VolunteeringOpportunity]) {
        let ref = Database.database().reference()

        // Loop through the opportunities and upload each one
        for opportunity in opportunities {
            // Using the id as the node key
            let opportunityRef = ref.child("volunteering_opportunities").child("\(opportunity.id)")

            // Convert the opportunity to a dictionary (or use Codable to automatically convert)
            let opportunityDict: [String: Any] = [
                "orgName": opportunity.orgName,
                "eventName": opportunity.eventName,
                "category": opportunity.category,
                "date": opportunity.date,
                "time": opportunity.time,
                "description": opportunity.description,
                "link": opportunity.link,
                "latitude": opportunity.latitude,
                "longitude": opportunity.longitude
            ]

            // Set the data at the node
            opportunityRef.setValue(opportunityDict) { error, _ in
                if let error = error {
                    print("Error uploading opportunity: \(error.localizedDescription)")
                } else {
                    print("Successfully uploaded opportunity with ID: \(opportunity.id)")
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
