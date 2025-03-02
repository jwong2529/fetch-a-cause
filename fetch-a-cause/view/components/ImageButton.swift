//
//  ImageButton.swift
//  fetch-a-cause
//
//  Created by Tiffany Mo on 3/1/25.
//

import SwiftUI

struct ImageButton: View {
    let imageUrl: String
    let aspectRatio: CGFloat
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            AsyncImage(url: URL(string: imageUrl + "&format=webp")) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(aspectRatio, contentMode: .fit)
                case .failure(_):
                    Rectangle()
                        .fill(Color.gray.opacity(0.3))
                        .aspectRatio(aspectRatio, contentMode: .fit)
                case .empty:
                    Rectangle()
                        .fill(Color.gray.opacity(0.3))
                        .aspectRatio(aspectRatio, contentMode: .fit)
                        .overlay(
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle())
                        )
                @unknown default:
                    Rectangle()
                        .fill(Color.gray.opacity(0.3))
                        .aspectRatio(aspectRatio, contentMode: .fit)
                }
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
}
