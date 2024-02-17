//
//  LoginViewModel.swift
//  mybooks
//
//  Created by Maxime Delporte on 17/02/2024.
//

import Foundation
import FirebaseAuth
import SwiftUI

class LoginViewModel: ObservableObject {
    
    @Published var userIsUnknown = false
    
    func login(with email: String, and password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            guard let self = self else { return }
            userIsUnknown = authResult == nil
            print(authResult)
        }
    }
}
