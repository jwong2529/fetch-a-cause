//
//  PostPageStyles.swift
//  fetch-a-cause
//
//  Created by Tiffany Mo on 3/1/25.
//

import SwiftUI

extension Color {
    static let textPrimary = Color(red: 29/255, green: 26/255, blue: 32/255)
    static let textSecondary = Color(red: 174/255, green: 174/255, blue: 174/255)
}

extension Font {
    static func rubik(size: CGFloat, weight: Font.Weight = .regular) -> Font {
        .custom("Rubik", size: size, relativeTo: .body).weight(weight)
    }
}

struct PostPageStyles {
    struct TextStyles {
        static let header = Font.rubik(size: 36, weight: .bold)
        static let body = Font.rubik(size: 14)
        static let bodyBold = Font.rubik(size: 14, weight: .bold)
        static let timestamp = Font.rubik(size: 14)
    }

    struct Spacing {
        static let standard: CGFloat = 20
        static let small: CGFloat = 8
        static let medium: CGFloat = 16
    }
}
