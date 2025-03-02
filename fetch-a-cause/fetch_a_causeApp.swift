//
//  fetch_a_causeApp.swift
//  fetch-a-cause
//
//  Created by Janice Wong on 3/1/25.
//

import SwiftUI

@main
struct fetch_a_causeApp: App {
    var body: some Scene {
        WindowGroup {
            PostPage(post: PostData.sample)
        }
    }
}
