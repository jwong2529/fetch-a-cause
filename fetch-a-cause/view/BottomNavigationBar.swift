import SwiftUI
import MapboxMaps

struct BottomNavigationBar: View {
    @Binding var selectedTab: Tab

    var body: some View {
        TabView(selection: $selectedTab) {
            HomePage()
                .tabItem {
                    Label(Tab.home.rawValue, systemImage: Tab.home.iconName)
                }
                .tag(Tab.home)

//            MapView(opportunities: <#[VolunteeringOpportunity]#>)
//                .tabItem {
//                    Label(Tab.search.rawValue, systemImage: Tab.search.iconName)
//                }
//                .tag(Tab.search)

            ProfilePage()
                .tabItem {
                    Label(Tab.profile.rawValue, systemImage: Tab.profile.iconName)
                }
                .tag(Tab.profile)
        }
        .tint(.textPrimary)
    }
}

// Placeholder views for navigation
struct HomeView: View {
    var body: some View {
        NavigationView {
            Text("Home View")
                .navigationTitle("Home")
        }
    }
}



// Custom style for the tab bar
struct CustomTabBarStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .onAppear {
                let appearance = UITabBarAppearance()
                appearance.configureWithOpaqueBackground()
                appearance.backgroundColor = .white

                UITabBar.appearance().standardAppearance = appearance
                UITabBar.appearance().scrollEdgeAppearance = appearance
            }
    }
}

// Preview
struct BottomNavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        BottomNavigationBar(selectedTab: .constant(.home))
            .modifier(CustomTabBarStyle())
    }
}
