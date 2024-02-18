//
//  LibraryListView.swift
//  mybooks
//
//  Created by Maxime Delporte on 18/02/2024.
//

import Foundation
import SwiftUI

struct LibraryListView: View {
    
    @Binding var path: NavigationPath
    
    var body: some View {
        VStack {
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
            
            MBButton(title: "Add Your First Book", style: .secondary, action: {})
                .padding(.top)
            
            Spacer()
        }
        .padding(.horizontal, 22)
    }
}

#Preview {
    @State var path: NavigationPath = .init()
    return LibraryListView(path: $path)
}
