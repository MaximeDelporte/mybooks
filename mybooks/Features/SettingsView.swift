//
//  SettingsView.swift
//  mybooks
//
//  Created by Maxime Delporte on 18/02/2024.
//

import Foundation
import SwiftUI

struct SettingsView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack {
            Spacer()
            
            MBButton(title: "Log out", style: .secondary, action: {
                Task {
                    viewModel.signOut()
                }
            })
            
            MBButton(title: "Delete account", style: .text, action: {
                // TODO: Delete Account
            })
        }
        .padding(.horizontal, 22.0)
    }
}

#Preview {
    SettingsView()
        .environmentObject(AuthViewModel())
}
