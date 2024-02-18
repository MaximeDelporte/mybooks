//
//  AuthViewModel.swift
//  mybooks
//
//  Created by Maxime Delporte on 18/02/2024.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

@MainActor
class AuthViewModel: ObservableObject {
    
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    @Published var showLoginError: Bool = false
    
    @Published var signUpErrorString: String?
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
    func login(with email: String, and password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
        } catch {
            self.showLoginError = true
            print("ERROR - \(error.localizedDescription)")
        }
    }
    
    func signUp(with email: String, and password: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            let user = User(id: result.user.uid, firstName: "", lastName: "", email: email, books: [])
            let encodedUser = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
            self.userSession = result.user
        } catch {
            self.signUpErrorString = error.localizedDescription
            print("ERROR - \(error.localizedDescription)")
        }
    }
}
