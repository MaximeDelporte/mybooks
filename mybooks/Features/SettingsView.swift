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
        }
    }
}

#Preview {
    SettingsView()
        .environmentObject(AuthViewModel())
}
