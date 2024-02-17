//
//  MBButton.swift
//  mybooks
//
//  Created by Maxime Delporte on 17/02/2024.
//

import Foundation
import SwiftUI

enum MBButtonStyle {
    case primary
    case secondary
    
    var backgroundColor: Color {
        switch self {
        case .primary:
            return .MBBlue
        case .secondary:
            return .clear
        }
    }
    
    var foregroundColor: Color {
        switch self {
        case .primary:
            return .white
        case .secondary:
            return .primary
        }
    }
}

struct MBButton: View {
    
    var title: String
    var style: MBButtonStyle
    var action: () -> Void
    
    var body: some View {
        Button(action: action, label: {
            Text(title)
                .padding(.vertical, 12)
                .frame(maxWidth: .infinity)
                .background(style.backgroundColor)
                .foregroundColor(style.foregroundColor)
                .font(.system(size: 22, weight: .semibold))
        })
        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 8.0, height: 8.0)))
    }
}

#Preview {
    MBButton(title: "Hello", style: .primary, action: {})
}
