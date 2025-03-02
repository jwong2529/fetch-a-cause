//
//  fetch_a_causeApp.swift
//  fetch-a-cause
//
//  Created by Janice Wong on 3/1/25.
//

import SwiftUI

import FirebaseCore


class AppDelegate: NSObject, UIApplicationDelegate {

  func application(_ application: UIApplication,

                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {

    FirebaseApp.configure()

    return true

  }

}

@main
struct fetch_a_causeApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @State private var selectedTab: Tab = .home  // Declare the state variable to manage selected tab

    var body: some Scene {
        WindowGroup {
//            HomePage()  // Pass the binding to HomePage
            //BottomNavigationBar(selectedTab: $selectedTab)
        }
    }
}
