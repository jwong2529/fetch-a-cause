//
//  PostPageViews.swift
//  fetch-a-cause
//
//  Created by Tiffany Mo on 3/1/25.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        Text("Post")
            .font(PostPageStyles.TextStyles.header)
            .foregroundColor(.textPrimary)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, PostPageStyles.Spacing.standard)
            .padding(.bottom, PostPageStyles.Spacing.small)
    }
}

struct PostContentView: View {
    let post: PostData

    var body: some View {
        VStack(alignment: .leading, spacing: 17) {
            HStack(spacing: PostPageStyles.Spacing.small) {
                AsyncImage(url: URL(string: post.userImage)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    Color.gray.opacity(0.3)
                }
                .frame(width: 60, height: 60)

                VStack(alignment: .leading, spacing: 4) {
                    Text(PostData.sample.username)
                        .font(PostPageStyles.TextStyles.bodyBold).foregroundColor(.textPrimary) +
                    Text(" \(PostData.sample.activityType) ")
                        .font(PostPageStyles.TextStyles.body).foregroundColor(.textPrimary) +
                    Text(PostData.sample.eventType)
                        .font(PostPageStyles.TextStyles.bodyBold).foregroundColor(.textPrimary) +
                    Text(" event ")
                        .font(PostPageStyles.TextStyles.body).foregroundColor(.textPrimary) 
                    Text(PostData.sample.timeAgo)
                        .font(PostPageStyles.TextStyles.timestamp)
                        .foregroundColor(.textSecondary)
                }
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: true)
            }
            .padding(.horizontal, PostPageStyles.Spacing.standard)
            .padding(.vertical, 10)

            AsyncImage(url: URL(string: post.badgeImage)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                Color.gray.opacity(0.3)
            }
            .frame(maxWidth: 335)
            .cornerRadius(20)
            .padding(.horizontal, PostPageStyles.Spacing.standard)
        }
        .padding(.vertical, 18)
        .background(Color.white)
    }
}

struct FooterImageView: View {
    let imageUrl: String

    var body: some View {
        AsyncImage(url: URL(string: imageUrl)) { image in
            image
                .resizable()
                .aspectRatio(3.91, contentMode: .fit)
        } placeholder: {
            Color.gray.opacity(0.3)
        }
        .padding(.top, 33)
    }
}
