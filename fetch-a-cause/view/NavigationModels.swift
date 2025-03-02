//
//  NavigationModels.swift
//  fetch-a-cause
//
//  Created by Tiffany Mo on 3/1/25.
//

import Foundation

enum Tab: String, CaseIterable {
    case home = "Home"
    case search = "Search"
    case profile = "Profile"

    var iconName: String {
        switch self {
        case .home:
            return "house.fill"
        case .search:
            return "magnifyingglass"
        case .profile:
            return "person.fill"
        }
    }
}
