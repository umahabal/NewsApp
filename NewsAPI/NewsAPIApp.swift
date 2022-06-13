//
//  NewsAPIApp.swift
//  NewsAPI
//
//  Created by URM on 10/06/22.
//

import SwiftUI
import FirebaseCore

//class AppDelegate: NSObject, UIApplicationDelegate {
//  func application(_ application: UIApplication,
//                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
//    FirebaseApp.configure()
//
//    return true
//  }
//}


@main
struct NewsAPIApp: App {
    
    init() {
        // Use the Firebase library to configure APIs.
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
//            ContentView()
            
            NewListView()
        }
    }
}
