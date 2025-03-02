//
//  PostPage.swift
//  fetch-a-cause
//
//  Created by Tiffany Mo on 3/1/25.
//

import SwiftUI

struct PostPage: View {
    let post: PostData

    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                HeaderView()
                    .padding(.top, 44)

                PostContentView(post: post)

                FooterImageView(imageUrl: post.footerImage)
            }
        }
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 32))
        .frame(maxWidth: 375)
    }
}

struct PostPage_Previews: PreviewProvider {
    static var previews: some View {
        PostPage(post: PostData.sample)
            .previewLayout(.sizeThatFits)
    }
}
