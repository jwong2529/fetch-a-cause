//
//  ActivityPost.swift
//  fetch-a-cause
//
//  Created by Tiffany Mo on 3/1/25.
//

import SwiftUI

struct ActivityPost: View {
    let profileImage: String
    let username: String
    let action: String
    let timeAgo: String
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

                VStack(alignment: .leading, spacing: 4) {
                    Text(username)
                        .font(.custom("Rubik", size: 14))
                        .fontWeight(.medium) +
                    Text(" \(action)")
                        .font(.custom("Rubik", size: 14))
                        .fontWeight(.regular)

                    Text(timeAgo)
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

            AsyncImage(url: URL(string: "\(postImage)&format=webp")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(20)
                    .frame(maxWidth: 335)
            } placeholder: {
                Color.gray.opacity(0.3)
                    .frame(maxWidth: 335)
                    .aspectRatio(1, contentMode: .fit)
                    .cornerRadius(20)
            }
            .padding(.horizontal, 20)
        }
        .background(Color.white)
    }
}
