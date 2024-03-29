//
//  EmptyListView.swift
//  mybooks
//
//  Created by Maxime Delporte on 21/02/2024.
//

import Foundation
import SwiftUI

struct EmptyListView: View {
    
    @Binding var shouldPresentSheet: Bool
    
    var body: some View {
        Image("library-home")
            .resizable()
            .aspectRatio(contentMode: .fit)
        
        Text("Start your digital library")
            .font(.system(size: 22, weight: .bold, design: .rounded))
            .foregroundStyle(.primary)
            .padding(.vertical)
        
        Text("Add your first book to get started.")
            .font(.system(size: 16, weight: .regular, design: .rounded))
            .foregroundStyle(.primary)
        
        MBButton(title: "Add Your First Book", style: .secondary, action: {
            shouldPresentSheet.toggle()
        }).padding(.top)
        
        Spacer()
    }
}

#Preview {
    @State var shouldPresentSheet = false
    return EmptyListView(shouldPresentSheet: $shouldPresentSheet)
}
