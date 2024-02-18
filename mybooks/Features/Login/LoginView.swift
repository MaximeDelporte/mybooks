//
//  LoginView.swift
//  mybooks
//
//  Created by Maxime Delporte on 17/02/2024.
//

import Combine
import FirebaseAuth
import SwiftUI

struct LoginView: View {
    
    private enum LoginField {
        case email
        case password
    }
    
    @State private var path: NavigationPath = .init()
    @FocusState private var focusedField: LoginField?
    
    @State private var email: String = ""
    @State private var password: String = ""
    @ObservedObject private var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationStack(path: $path, root: {
            VStack {
                ZStack(alignment: .bottomLeading, content: {
                    Image("library-main")
                        .resizable()
                        .ignoresSafeArea()
                        .blur(radius: 4.0, opaque: true)
                    
                    Text("Welcome back")
                        .font(.system(size: 40, weight: .bold, design: .rounded))
                        .foregroundStyle(.white)
                        .frame(alignment: .leading)
                        .shadow(color: .black, radius: 2, x: 0, y: 2)
                        .padding()
                })
                
                VStack {
                    Spacer()
                    
                    MBTextField(placeholder: "Email address", value: $email)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                        .focused($focusedField, equals: .email)
                        .submitLabel(.next)
                        .padding(.bottom, 18)
                    
                    MBTextField(placeholder: "Password", value: $password, isSecure: true)
                        .textInputAutocapitalization(.never)
                        .focused($focusedField, equals: .password)
                        .submitLabel(.join)
                    
                    Text("L'email ou le mot de passe ne sont pas corrects.")
                        .frame(maxWidth: .infinity, alignment: .center)
                        .font(.system(size: 13, weight: .regular, design: .rounded))
                        .foregroundStyle(.red)
                        .opacity(viewModel.userIsUnknown ? 1 : 0)
                    
                    Spacer()
                }
                .padding(.horizontal, 22)
                .padding(.vertical, 16)
                .onSubmit {
                    switch focusedField {
                    case .email:
                        focusedField = .password
                    default:
                        login()
                    }
                }
                
                VStack {
                    MBButton(title: "Log In", style: .primary, action: login)
                        .opacity(email.isEmpty || password.isEmpty ? 0.5 : 1.0)
                        .disabled(email.isEmpty || password.isEmpty)
                        .padding(.bottom, 4)
                    
                    MBButton(title: "New user? Sign Up", style: .secondary, action: {
                        path.append(SignUpView.screenName)
                    })
                    .padding(.bottom, 8)
                }
                .padding(.horizontal, 22)
            }
            .navigationDestination(for: String.self, destination: { screenName in
                if screenName == SignUpView.screenName {
                    SignUpView()
                }
            })
            .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardDidShowNotification)) { _ in
                viewModel.userIsUnknown = false
            }
        })
    }
    
    private func login() {
        if email.isEmpty || password.isEmpty { return }
        hideKeyboard()
        viewModel.login(with: email, and: password)
    }
}

#Preview {
    LoginView()
}
