//
//  SignUpViewModel.swift
//  mybooks
//
//  Created by Maxime Delporte on 17/02/2024.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class SignUpViewModel: ObservableObject {
    
    @Published var errorIsVisible = false
    @Published var errorString: String = ""
    
    func signUp(with email: String, and password: String) async throws {
        errorIsVisible = false
        
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            let user = User(id: result.user.uid, firstName: "", lastName: "", email: email, books: [])
            let encodedUser = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
        } catch {
            errorIsVisible = true
            errorString = error.localizedDescription
        }
    }
}
