import SwiftUI

struct SearchBar: View {
    @State private var searchText: String = ""

    var body: some View {
        HStack(spacing: 12) {
            AsyncImage(url: URL(string: "https://cdn.builder.io/api/v1/image/assets/TEMP/6cadb4c61ca71b9fceb3936e6baa14dd65315d57af32718c90431e9096b49598?placeholderIfAbsent=true&apiKey=4822da42d44648d1bf97a175a2e7cb62&format=webp")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
            } placeholder: {
                Color.gray.opacity(0.3)
                    .frame(width: 20, height: 20)
            }

            Text("What are you looking for?")
                .font(.custom("Rubik", size: 16))
                .foregroundColor(Color(red: 174/255, green: 174/255, blue: 174/255))
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 13)
        .background(Color(red: 218/255, green: 218/255, blue: 218/255))
        .cornerRadius(100)
        .frame(maxWidth: 335)
    }
}
