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
    
    var body: some View {
        
        TextField(placeholder, text: $value)
            .padding(.horizontal)
            .multilineTextAlignment(.leading)
            .lineLimit(1)
            .frame(width: .infinity, height: 48)
            .background(Color.MBGray)
            .font(.system(size: 20, weight: .semibold, design: .rounded))
            .foregroundColor(.primary)
            .clipShape(RoundedRectangle(cornerSize: CGSize(width: 8.0, height: 8.0)))
    }
}
