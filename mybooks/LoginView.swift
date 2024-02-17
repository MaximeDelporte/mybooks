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
        VStack {
            ZStack(alignment: .bottomLeading, content: {
                Image("library")
                    .resizable()
                    .ignoresSafeArea()
                    .blur(radius: 4.0, opaque: true)
                
                Text("Welcome back")
                    .font(.system(size: 40, weight: .bold, design: .rounded))
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
            })
            
            VStack(alignment: .center, content: {
                Spacer()
               
                MBTextField(placeholder: "Email address", value: email)
                    .padding(.bottom, 18)
                
                MBTextField(placeholder: "Password", value: password)
                
                Spacer()
                
                MBButton(title: "Log In", style: .primary, action: {})
                    .padding(.bottom, 4)
                
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
