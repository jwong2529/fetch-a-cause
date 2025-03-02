//
//  EventCard.swift
//  fetch-a-cause
//
//  Created by Tiffany Mo on 3/2/25.
//

import SwiftUI

struct EventCard: View {
    let eventName: String
    let description: String
    let backgroundColor: Color
    let actionColor: Color
    let date: String
    let time: String
    let orgName: String
    var showArrow: Bool = false

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
                        .font(.custom("Rubik-Bold", size: 20))
                        .foregroundColor(actionColor)

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
    }
}

//struct EventCard_Previews: PreviewProvider {
//    static var previews: some View {
//        EventCard(
//            eventName: "Sample Event",
//            description: "Sample description",
//            backgroundColor: .pinkBackground,
//            actionColor: .actionPink
//        )
//        .padding()
//    }
//}
