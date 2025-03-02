//
//  VolunteeringOpportunity.swift
//  fetch-a-cause
//
//  Created by Janice Wong on 3/1/25.
//

import Foundation

struct VolunteeringOpportunity: Identifiable {
    let id: Int
    let orgName: String
    let eventName: String
    let category: String
    let date: String
    let time: String
    let description: String
    let link: String
    let latitude: Double
    let longitude: Double
}

func loadVolunteeringOpportunities() -> [VolunteeringOpportunity] {
    guard let path = Bundle.main.path(forResource: "Volunteer Mock Data", ofType: "csv") else {
        print("CSV file not found")
        return []
    }
    
    do {
        let data = try String(contentsOfFile: path, encoding: .utf8)
        
        // Split the data by lines
        let rows = data.split(separator: "\n")
        
        var opportunities = [VolunteeringOpportunity]()
        
        // Skip header (first row)
        for row in rows.dropFirst() {
            // Split the row by commas
            let columns = row.split(separator: ",")
            
            // Ensure there are enough columns
            if columns.count == 10 {
                if let id = Int(columns[0]),
                   let latitude = Double(columns[8]),
                   let longitude = Double(columns[9]) {
                    let opportunity = VolunteeringOpportunity(
                        id: id,
                        orgName: String(columns[1]),
                        eventName: String(columns[2]),
                        category: String(columns[3]),
                        date: String(columns[4]),
                        time: String(columns[5]),
                        description: String(columns[6]),
                        link: String(columns[7]),
                        latitude: latitude,
                        longitude: longitude
                    )
                    opportunities.append(opportunity)
                }
            }
        }
        
        return opportunities
    } catch {
        print("Failed to read CSV: \(error)")
        return []
    }
}

