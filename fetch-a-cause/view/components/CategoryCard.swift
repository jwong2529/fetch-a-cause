

import SwiftUI

struct CategoryCard: View {
    let image: String
    let title: String
    let backgroundColor: Color

    var body: some View {
        VStack(spacing: 0) {
            Image(image) // Load image from assets
                .resizable()
                .aspectRatio(1.03, contentMode: .fit)
                .frame(width: 145)
                .offset(y: -15)
                .zIndex(10)

            Text(title)
                .font(.custom("Rubik", size: 14))
                .fontWeight(.medium)
                .foregroundColor(Color(red: 29/255, green: 26/255, blue: 32/255))
                .frame(maxWidth: .infinity)
                .padding(.vertical, 16)
                .padding(.horizontal, 20)
                .background(Color.white)
                .cornerRadius(16, corners: [.bottomLeft, .bottomRight])
        }
        .frame(width: 152)
        .background(backgroundColor)
        .cornerRadius(16)
        .shadow(color: Color(red: 23/255, green: 37/255, blue: 40/255, opacity: 0.1), radius: 10, x: 4, y: 4)
    }
}


// Helper extension for partial corner radius
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
