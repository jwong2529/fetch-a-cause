//
//  PostData.swift
//  fetch-a-cause
//
//  Created by Tiffany Mo on 3/1/25.
//

import Foundation

struct PostData {
    let userImage: String
    let username: String
    let activityType: String
    let eventType: String
    let timeAgo: String
    let badgeImage: String
    let footerImage: String
}

extension PostData {
    static let sample = PostData(
        userImage: "https://cdn.builder.io/api/v1/image/assets/TEMP/556dc39c363e5da1503510a0ce8b82e33f154a3e54731db22d97a69d70b9acec?placeholderIfAbsent=true&apiKey=4822da42d44648d1bf97a175a2e7cb62&format=webp",
        username: "Janice Wong",
        activityType: "earned a new badge for attending a",
        eventType: "Health and Medicine",
        timeAgo: "44 min ago",
        badgeImage: "https://cdn.builder.io/api/v1/image/assets/TEMP/b4401a3c006d96a619b270e3e3d7f0a9e3ca72f761a43c32e77323fc0080cef5?placeholderIfAbsent=true&apiKey=4822da42d44648d1bf97a175a2e7cb62&format=webp",
        footerImage: "https://cdn.builder.io/api/v1/image/assets/TEMP/a76601312dc54f31cfed8f6baac5610f263edd792b73162f64af1ee5a9a0ec78?placeholderIfAbsent=true&apiKey=4822da42d44648d1bf97a175a2e7cb62&format=webp"
    )
}
