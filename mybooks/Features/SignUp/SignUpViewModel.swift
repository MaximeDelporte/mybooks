//
//  SignUpViewModel.swift
//  mybooks
//
//  Created by Maxime Delporte on 17/02/2024.
//

import FirebaseAuth
import Foundation

class SignUpViewModel: ObservableObject {
    
    @Published var errorIsVisible = false
    @Published var errorString: String = ""
    
    func signUp(with email: String, and password: String) {
        errorIsVisible = false
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] authResult, error in
            guard let self = self else { return }
            
            if let error {
                errorIsVisible = true
                errorString = error.localizedDescription
            } else {
                print(authResult)
                print("user: \(authResult?.user)")
                print("credential: \(authResult?.credential)")
            }
        }
    }
}
