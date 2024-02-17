//
//  SignUpViewModel.swift
//  mybooks
//
//  Created by Maxime Delporte on 17/02/2024.
//

import FirebaseAuth
import Foundation

class SignUpViewModel: ObservableObject {
    
    func signUp(with email: String, and password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            
        }
    }
}
