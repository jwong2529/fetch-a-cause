////
////  ActivityPost.swift
////  fetch-a-cause
////
////  Created by Tiffany Mo on 3/1/25.
////
//
//import SwiftUI
//
//struct ActivityPost: View {
//    let profileImage: String
//    let username: String
//    let action: String
//    let timestamp: TimeInterval
//    let postImage: String
//
//    var body: some View {
//        VStack(alignment: .leading, spacing: 10) {
//            HStack(spacing: 8) {
//                AsyncImage(url: URL(string: "\(profileImage)&format=webp")) { image in
//                    image
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .frame(width: 60, height: 60)
//                } placeholder: {
//                    Color.gray.opacity(0.3)
//                        .frame(width: 60, height: 60)
//                }
//
//                VStack(alignment: .leading, spacing: 4) {
//                    Text(username)
//                        .font(.custom("Rubik", size: 14))
//                        .fontWeight(.medium) +
//                    Text(" \(action)")
//                        .font(.custom("Rubik", size: 14))
//                        .fontWeight(.regular)
//
//                    Text(timeAgoSinceDate(timestamp: timestamp))
//                        .font(.custom("Rubik", size: 14))
//                        .foregroundColor(Color(red: 174/255, green: 174/255, blue: 174/255))
//                }
//
//                Spacer()
//
//                AsyncImage(url: URL(string: "https://cdn.builder.io/api/v1/image/assets/TEMP/d9d0c61cb35aa4f65f3562473560a8e264ce67f88997f19e8b310cdc578483e4?placeholderIfAbsent=true&apiKey=4822da42d44648d1bf97a175a2e7cb62&format=webp")) { image in
//                    image
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .frame(width: 24, height: 24)
//                } placeholder: {
//                    Color.gray.opacity(0.3)
//                        .frame(width: 24, height: 24)
//                }
//            }
//            .padding(.horizontal, 20)
//
//            AsyncImage(url: URL(string: "\(postImage)&format=webp")) { image in
//                image
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .cornerRadius(20)
//                    .frame(maxWidth: 335)
//            } placeholder: {
//                Color.gray.opacity(0.3)
//                    .frame(maxWidth: 335)
//                    .aspectRatio(1, contentMode: .fit)
//                    .cornerRadius(20)
//            }
//            .padding(.horizontal, 20)
//        }
//        .background(Color.white)
//    }
//    
//    func timeAgoSinceDate(timestamp: String) -> String {
//        let formatter = ISO8601DateFormatter()
//        guard let date = formatter.date(from: timestamp) else { return "Unknown time ago" }
//        
//        let currentDate = Date()
//        let calendar = Calendar.current
//        let components = calendar.dateComponents([.second, .minute, .hour, .day, .weekOfYear], from: date, to: currentDate)
//        
//        if let second = components.second, second < 60 {
//            return "\(second) s ago"
//        } else if let minute = components.minute, minute < 60 {
//            return "\(minute) m ago"
//        } else if let hour = components.hour, hour < 24 {
//            return "\(hour) h ago"
//        } else if let day = components.day, day < 7 {
//            return "\(day) d ago"
//        } else if let week = components.weekOfYear, week < 4 {
//            return "\(week) w ago"
//        } else {
//            let year = calendar.component(.year, from: date)
//            let currentYear = calendar.component(.year, from: currentDate)
//            if year == currentYear {
//                return "\(calendar.component(.month, from: date)) mon ago"
//            } else {
//                return "\(year) y ago"
//            }
//        }
//    }
//}


import SwiftUI

struct ActivityPost: View {
    let profileImage: String
    let username: String
    let action: String
    let timestamp: TimeInterval
    let opportunity: VolunteeringOpportunity
    let postImage: String

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(spacing: 8) {
                AsyncImage(url: URL(string: "\(profileImage)&format=webp")) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 60, height: 60)
                } placeholder: {
                    Color.gray.opacity(0.3)
                        .frame(width: 60, height: 60)
                }

//                VStack(alignment: .leading, spacing: 4) {
//                    Text(username)
//                        .font(.custom("Rubik", size: 14))
//                        .fontWeight(.medium) +
//                    Text(" \(action)")
//                        .font(.custom("Rubik", size: 14))
//                        .fontWeight(.regular)
//
//                    Text(timeAgoSinceDate(timestamp: timestamp))
//                        .font(.custom("Rubik", size: 14))
//                        .foregroundColor(Color(red: 174/255, green: 174/255, blue: 174/255))
//                }
                
                VStack(alignment: .leading, spacing: 4) {
                    // Styled username, action, and event type text
                    Text(username)
                        .font(.custom("Rubik", size: 14))
                        .fontWeight(.bold)
                        .foregroundColor(.black) +
                    Text(" \(action) ")
                        .font(.custom("Rubik", size: 14))
                        .fontWeight(.regular)
                        .foregroundColor(.black) +
                    Text("for attending a ")
                        .font(.custom("Rubik", size: 14))
                        .fontWeight(.regular)
                        .foregroundColor(.black) +
                    Text(opportunity.category)
                        .font(.custom("Rubik", size: 14))
                        .fontWeight(.heavy)
                        .foregroundColor(.black) +
                    Text(" event")
                        .font(.custom("Rubik", size: 14))
                        .fontWeight(.regular)
                        .foregroundColor(.black)

                    Text(timeAgoSinceDate(timestamp: timestamp))
                        .font(.custom("Rubik", size: 14))
                        .foregroundColor(Color(red: 174/255, green: 174/255, blue: 174/255))
                }

                Spacer()

                AsyncImage(url: URL(string: "https://cdn.builder.io/api/v1/image/assets/TEMP/d9d0c61cb35aa4f65f3562473560a8e264ce67f88997f19e8b310cdc578483e4?placeholderIfAbsent=true&apiKey=4822da42d44648d1bf97a175a2e7cb62&format=webp")) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24, height: 24)
                } placeholder: {
                    Color.gray.opacity(0.3)
                        .frame(width: 24, height: 24)
                }
            }
            .padding(.horizontal, 20)

            Image(postImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(20)
                    .frame(maxWidth: 335)
                    .padding(.horizontal, 20)
        }
        .background(Color.white)
    }
    
    func timeAgoSinceDate(timestamp: TimeInterval) -> String {
        let date = Date(timeIntervalSince1970: timestamp) // Convert TimeInterval to Date
        let currentDate = Date()
        let calendar = Calendar.current
        let components = calendar.dateComponents([.second, .minute, .hour, .day, .weekOfYear], from: date, to: currentDate)
        
        if let second = components.second, second < 60 {
            return "\(second) s ago"
        } else if let minute = components.minute, minute < 60 {
            return "\(minute) m ago"
        } else if let hour = components.hour, hour < 24 {
            return "\(hour) h ago"
        } else if let day = components.day, day < 7 {
            return "\(day) d ago"
        } else if let week = components.weekOfYear, week < 4 {
            return "\(week) w ago"
        } else {
            let year = calendar.component(.year, from: date)
            let currentYear = calendar.component(.year, from: currentDate)
            if year == currentYear {
                return "\(calendar.component(.month, from: date)) mon ago"
            } else {
                return "\(year) y ago"
            }
        }
    }
}
