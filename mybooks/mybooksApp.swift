//
//  mybooksApp.swift
//  mybooks
//
//  Created by Maxime Delporte on 17/02/2024.
//

import SwiftUI

@main
struct mybooksApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            let viewModel = LoginViewModel()
            LoginView(viewModel: viewModel)
        }
    }
}
