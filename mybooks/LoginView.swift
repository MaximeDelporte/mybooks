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
    
    var body: some View {
        ZStack {
            ZStack {
                Image("library")
                    .resizable()
                    .ignoresSafeArea()
                    .blur(radius: 28.0, opaque: true)
                
                Color.white.opacity(0.36).ignoresSafeArea()
            }
            
            VStack(alignment: .center, content: {
                
                Spacer()
                
                Text("Welcome back")
                    .font(.system(size: 32, weight: .semibold, design: .rounded))
                    .foregroundStyle(.primary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 32)
               
                MBTextField(placeholder: "Email address", value: email)
                    .padding(.bottom, 16)
                
                MBTextField(placeholder: "Password", value: password)
                
                Spacer()
                
                MBButton(title: "Log In", style: .primary, action: {})
                    .padding(.bottom, 8)
                
                MBButton(title: "New user? Sign Up", style: .secondary, action: {})
            })
            .padding(.horizontal, 22)
            .clipped()
        }
    }
}

#Preview {
    LoginView()
}
