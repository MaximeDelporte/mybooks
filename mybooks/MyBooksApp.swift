//
//  MyBooksApp.swift
//  mybooks
//
//  Created by Maxime Delporte on 17/02/2024.
//

import Firebase
import SwiftUI

@main
struct MyBooksApp: App {
    
    @StateObject var viewModel = AuthViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            AuthenticationView()
                .environmentObject(viewModel)
        }
    }
}

fileprivate struct AuthenticationView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                HomeView()
            } else {
                LoginView()
                    .environmentObject(viewModel)
            }
        }
    }
}
