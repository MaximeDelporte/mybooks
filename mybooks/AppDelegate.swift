//
//  AppDelegate.swift
//  mybooks
//
//  Created by Maxime Delporte on 17/02/2024.
//

import Foundation
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
