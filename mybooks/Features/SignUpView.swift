//
//  SignUpView.swift
//  mybooks
//
//  Created by Maxime Delporte on 17/02/2024.
//

import Foundation
import SwiftUI

struct SignUpView: View {
    
    static var screenName = "sign-up-view"
    
    @State var email: String = ""
    @State var password: String = ""
    @State var confirmPassword: String = ""
    
    var body: some View {
        VStack(spacing: 16, content: {
            Text("Sign Up")
                .font(.system(size: 24, weight: .bold, design: .rounded))
                .foregroundStyle(.primary)
            
            Spacer()
            
            MBTextField(placeholder: "Email", value: email)
            
            MBTextField(placeholder: "Password", value: password, isSecure: true)
            
            MBTextField(placeholder: "Confirm Password", value: confirmPassword, isSecure: true)
            
            Spacer()
            
            MBButton(title: "Sign up", style: .primary, action: {
                
            })
            .padding(.bottom, 16)
        })
        .padding(.horizontal, 12)
    }
}

#Preview {
    SignUpView()
}
