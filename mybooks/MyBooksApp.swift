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
    
    @StateObject var repository = AuthRepository()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            AuthenticationView()
                .environmentObject(repository)
        }
    }
}

fileprivate struct AuthenticationView: View {
    
    @EnvironmentObject var repository: AuthRepository
    
    var body: some View {
        Group {
            if repository.userSession != nil {
                HomeView()
                    .environmentObject(repository)
            } else {
                LoginView()
                    .environmentObject(repository)
            }
        }
    }
}
