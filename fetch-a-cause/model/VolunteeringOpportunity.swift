//
//  VolunteeringOpportunity.swift
//  fetch-a-cause
//
//  Created by Janice Wong on 3/1/25.
//

import Foundation
import CoreLocation

struct VolunteeringOpportunity: Identifiable {
    let id: Int
    let org_name: String
    let category: String
    let date: String
    let time: String
    let description: String
    let link: String
    let latitude: Double
    let longitude: Double
}
