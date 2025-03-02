//
//  CategoriesPage.swift
//  fetch-a-cause
//
//  Created by Tiffany Mo on 3/2/25.
//

import SwiftUI

struct CategoriesPage: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                Text("Food Security")
                    .font(.custom("Rubik-Bold", size: 30))
                    .foregroundColor(Color.primaryText)
                    .padding(.bottom, 13)

                Text("Events")
                    .font(.custom("Rubik-Regular", size: 22))
                    .foregroundColor(Color.primaryText)
                    .padding(.bottom, 43)

                VStack(spacing: 26) {
                    EventCard(
                        title: "Pantry Distribution",
                        description: "Help make more food available for seniors, those experiencing homelessness, and families.",
                        imageName: "https://cdn.builder.io/api/v1/image/assets/TEMP/15a58d7426737f909bcc2ec6cccfe61c4df0897ba6bc67e1ca707b93f8b62e4c?placeholderIfAbsent=true&apiKey=4822da42d44648d1bf97a175a2e7cb62",
                        backgroundColor: Color.pinkBackground,
                        actionColor: Color.actionPink
                    )

                    EventCard(
                        title: "Breakfast for Unhoused",
                        description: "SFC offer a unique range of services to sustain and empower those in need.",
                        imageName: "https://cdn.builder.io/api/v1/image/assets/TEMP/a5d91962b41d21ab679b8452a9db0ffbc123147ae2fd36d8825db09063b41957?placeholderIfAbsent=true&apiKey=4822da42d44648d1bf97a175a2e7cb62",
                        backgroundColor: Color.orangeBackground,
                        actionColor: Color.actionOrange,
                        showArrow: true
                    )

                    EventCard(
                        title: "Community Breakfast",
                        description: "Serve LA by providing meals, recovery, and holistic support to the unseen among us in the city.",
                        imageName: "https://cdn.builder.io/api/v1/image/assets/TEMP/9296c2110619dc6c3f1de9ccd3b9f63cd4a2414ab710fc645bf20ff67bbdb7bb?placeholderIfAbsent=true&apiKey=4822da42d44648d1bf97a175a2e7cb62",
                        backgroundColor: Color.pinkBackground,
                        actionColor: Color.actionPink
                    )
                }
            }
            .padding(.horizontal, 25)
            .padding(.vertical, 61)
            .background(Color.white)
            .cornerRadius(40)
        }
        .background(Color.white)
    }
}

struct CategoriesPage_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesPage()
    }
}
