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
    
    var body: some Scene {
        WindowGroup {
            PostPage(post: PostData.sample)
        }
    }
}
