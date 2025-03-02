
//  ProfilePage.swift
//  fetch-a-cause
//
//  Created by Tiffany Mo on 3/1/25.


import SwiftUI

struct ProfilePage: View {
    @State private var isNavigatingToPostPage = false  // State to control navigation

    var body: some View {
        NavigationView {  // Wrap everything in a NavigationView
            ScrollView {
                VStack(spacing: 0) {
                    ImageButton(
                        imageUrl: "https://cdn.builder.io/api/v1/image/assets/TEMP/364a41f43d1d6d6dc8fd498ca4c713f207576609d35f1b6c9b87b4a559dba1e5?placeholderIfAbsent=true&apiKey=4822da42d44648d1bf97a175a2e7cb62",
                        aspectRatio: 0.42
                    ) {
                        isNavigatingToPostPage = true  // Trigger navigation when tapped
                    }
                    .background(
                        NavigationLink(
                            destination: PostPage(post: PostData.sample),
                            isActive: $isNavigatingToPostPage
                        ) {
                            EmptyView()
                        }
                        .hidden()
                    )
                }
            }
            .background(Color.white)
            .frame(maxWidth: 480)
            .navigationTitle("Profile") // Optional: Adds a navigation title
        }
    }
}

struct ProfilePage_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePage()
    }
}

