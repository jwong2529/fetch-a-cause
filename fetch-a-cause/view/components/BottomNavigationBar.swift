//
//  BottomNavigationBar.swift
//  fetch-a-cause
//
//  Created by Tiffany Mo on 3/1/25.
//

import SwiftUI

struct BottomNavigationBar: View {
    var body: some View {
        HStack(spacing: 40) {
            HStack {
                AsyncImage(url: URL(string: "https://cdn.builder.io/api/v1/image/assets/TEMP/ebda3e31e7f7167ca2ab8f768473c806e2145c464bca0d86b11006d72f6ec083?placeholderIfAbsent=true&apiKey=4822da42d44648d1bf97a175a2e7cb62&format=webp")) { image in
                    image
                        .resizable()
                        .aspectRatio(1.33, contentMode: .fit)
                        .frame(width: 64)
                } placeholder: {
                    Color.gray.opacity(0.3)
                        .frame(width: 64, height: 48)
                }

                VStack(spacing: 4) {
                    Text("Explore")
                        .font(.custom("Rubik", size: 14))
                        .fontWeight(.medium)
                        .foregroundColor(Color(red: 29/255, green: 26/255, blue: 32/255))

                    Rectangle()
                        .frame(width: 44, height: 2)
                        .foregroundColor(Color(red: 29/255, green: 26/255, blue: 32/255))
                }
                .padding(.horizontal, 6)
                .padding(.vertical, 8)
            }

            AsyncImage(url: URL(string: "https://cdn.builder.io/api/v1/image/assets/TEMP/81f66a0340b2e50793ba0f158cdcd8ed9b97c308b8efbdcca23ce1a579fa888d?placeholderIfAbsent=true&apiKey=4822da42d44648d1bf97a175a2e7cb62&format=webp")) { image in
                image
                    .resizable()
                    .aspectRatio(2.67, contentMode: .fit)
                    .frame(width: 128)
            } placeholder: {
                Color.gray.opacity(0.3)
                    .frame(width: 128, height: 48)
            }
        }
        .padding(.horizontal, 20)
        .background(Color.white)
        .cornerRadius(32, corners: [.topLeft, .topRight])
    }
}
