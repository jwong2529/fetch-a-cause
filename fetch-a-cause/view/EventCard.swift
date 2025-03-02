//
//  EventCard.swift
//  fetch-a-cause
//
//  Created by Tiffany Mo on 3/2/25.
//

import SwiftUI

struct EventCard: View {
    let title: String
    let description: String
    let imageName: String
    let backgroundColor: Color
    let actionColor: Color
    var showArrow: Bool = false

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            VStack(alignment: .leading, spacing: 8) {
                Text(title)
                    .font(.custom("Rubik-Regular", size: 20))
                    .lineSpacing(0)

                Text(description)
                    .font(.custom("Rubik-Regular", size: 12))
                    .lineSpacing(4)

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

            AsyncImage(url: URL(string: "\(imageName)&format=webp")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                Color.clear
            }
            .frame(width: showArrow ? 79 : 97)
            .padding(.top, showArrow ? 34 : 13)
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

struct EventCard_Previews: PreviewProvider {
    static var previews: some View {
        EventCard(
            title: "Sample Event",
            description: "Sample description",
            imageName: "https://cdn.builder.io/api/v1/image/assets/TEMP/15a58d7426737f909bcc2ec6cccfe61c4df0897ba6bc67e1ca707b93f8b62e4c?placeholderIfAbsent=true&apiKey=4822da42d44648d1bf97a175a2e7cb62",
            backgroundColor: .pinkBackground,
            actionColor: .actionPink
        )
        .padding()
    }
}
