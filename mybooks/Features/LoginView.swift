//
//  LoginView.swift
//  mybooks
//
//  Created by Maxime Delporte on 17/02/2024.
//

import SwiftUI

struct LoginView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    
    @State private var path: NavigationPath = .init()
    
    var body: some View {
        NavigationStack(path: $path, root: {
            VStack {
                ZStack(alignment: .bottomLeading, content: {
                    Image("library")
                        .resizable()
                        .ignoresSafeArea()
                        .blur(radius: 4.0, opaque: true)
                    
                    Text("Welcome back")
                        .font(.system(size: 40, weight: .bold, design: .rounded))
                        .foregroundStyle(.white)
                        .frame(alignment: .leading)
                        .padding()
                })
                
                VStack {
                    Spacer()
                    
                    MBTextField(placeholder: "Email address", value: email)
                        .padding(.bottom, 18)
                    
                    MBTextField(placeholder: "Password", value: password)
                    
                    Spacer()
                    
                    MBButton(title: "Log In", style: .primary, action: {
                        
                    })
                    .padding(.bottom, 4)
                    
                    MBButton(title: "New user? Sign Up", style: .secondary, action: {
                        path.append(SignUpView.screenName)
                    })
                }
                .padding(.horizontal, 22)
            }
            .navigationDestination(for: String.self, destination: { screenName in
                let _ = print("screenName: \(screenName)")
                if screenName == SignUpView.screenName {
                    SignUpView()
                }
            })
        })
    }
}

#Preview {
    LoginView()
}
