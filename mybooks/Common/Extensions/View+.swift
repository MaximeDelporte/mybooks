//
//  View+.swift
//  mybooks
//
//  Created by Maxime Delporte on 17/02/2024.
//

import Foundation
import SwiftUI

extension View {
    
    public func MBTextFieldStyle() -> some View {
        self
            .padding(.horizontal)
            .multilineTextAlignment(.leading)
            .lineLimit(1)
            .frame(height: 48)
            .background(Color.MBGray)
            .font(.system(size: 20, weight: .semibold, design: .rounded))
            .foregroundColor(.primary)
            .clipShape(RoundedRectangle(cornerSize: CGSize(width: 8.0, height: 8.0)))
    }
}
