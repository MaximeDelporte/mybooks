//
//  SignUpView.swift
//  mybooks
//
//  Created by Maxime Delporte on 17/02/2024.
//

import AuthenticationServices
import FirebaseAuth
import FirebaseCore
import Foundation
import SwiftUI

struct SignUpView: View {
    
    static var screenName = "sign-up-view"
    
    @State var email: String = ""
    @State var password: String = ""
    @State var confirmPassword: String = ""
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    // MARK: - Private Properties
    
    private var signUpButtonIsDisabled: Bool {
        let fieldsAreEmpties = email.isEmpty || password.isEmpty || confirmPassword.isEmpty
        if fieldsAreEmpties { return true }
        
        let passwordNotMatch = password != confirmPassword
        return fieldsAreEmpties || passwordNotMatch
    }
    
    private var errorMessage: String {
        viewModel.signUpErrorString ?? ""
    }
    
    var body: some View {
        VStack(spacing: 16, content: {
            Text("Sign Up")
                .font(.system(size: 24, weight: .bold, design: .rounded))
                .foregroundStyle(.primary)
            
            Spacer()
            
            MBTextField(placeholder: "Email", value: $email)
                .keyboardType(.emailAddress)
                .textInputAutocapitalization(.never)
            
            MBTextField(placeholder: "Password", value: $password, isSecure: true)
                .textInputAutocapitalization(.never)
            
            MBTextField(placeholder: "Confirm Password", value: $confirmPassword, isSecure: true)
                .textInputAutocapitalization(.never)
            
            Spacer()
            
            Text(errorMessage)
                .frame(maxWidth: .infinity, alignment: .center)
                .font(.system(size: 13, weight: .regular, design: .rounded))
                .foregroundStyle(.red)
                .opacity(errorMessage.isEmpty ? 0.0 : 1.0)
            
            MBButton(title: "Sign up", style: .primary, action: {
                signUp()
            })
            .opacity(signUpButtonIsDisabled ? 0.5 : 1.0)
            .disabled(signUpButtonIsDisabled)
            .padding(.bottom, 16)
        })
        .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardDidShowNotification)) { _ in
            viewModel.signUpErrorString = nil
        }
        .padding(.horizontal, 12)
    }
    
    private func signUp() {
        if signUpButtonIsDisabled { return }
        hideKeyboard()
        Task {
            try await viewModel.signUp(with: email, and: password)
        }
    }
}

#Preview {
    SignUpView()
}
