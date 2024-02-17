//
//  MBTextField.swift
//  mybooks
//
//  Created by Maxime Delporte on 17/02/2024.
//

import Foundation
import SwiftUI

struct MBTextField: View {
    
    var placeholder: String
    @State var value: String
    var isSecure: Bool = false
    
    var body: some View {
        if isSecure {
            SecureField(placeholder, text: $value)
                .MBTextFieldStyle()
        } else {
            TextField(placeholder, text: $value)
                .MBTextFieldStyle()
                
        }
    }
}
