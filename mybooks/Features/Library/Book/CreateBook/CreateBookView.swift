//
//  CreateBookView.swift
//  mybooks
//
//  Created by Maxime Delporte on 20/02/2024.
//

import Foundation
import SwiftUI

struct CreateBookView: View {
    
    @Binding var shouldPresentSheet: Bool
    
    @State var title: String = ""
    @State var description: String = ""
    
    var crossSize: CGFloat = 20
    @ObservedObject var viewModel = CreateBookViewModel()
    
    var body: some View {
        VStack {
            HStack {
                Button(action: { shouldPresentSheet.toggle() }, label: {
                    Image("cross")
                        .resizable()
                        .frame(width: crossSize, height: crossSize)
                        .padding()
                })
                .padding(.horizontal, -16)
                
                Spacer()
            }
            
            Text("Create Book")
                .font(.system(size: 24, weight: .bold, design: .rounded))
                .foregroundStyle(.primary)
            
            Spacer()
            
            MBTextField(placeholder: "Title", value: $title)
                .keyboardType(.emailAddress)
                .textInputAutocapitalization(.words)
            
            MBTextField(placeholder: "Description", value: $description)
                .keyboardType(.default)
                .textInputAutocapitalization(.sentences)
            
            Spacer()
            
            MBButton(title: "Save Book", style: .primary, action: self.saveBook)
                .opacity(title.isEmpty || description.isEmpty ? 0.5 : 1.0)
                .disabled(title.isEmpty || description.isEmpty)
                .padding(.bottom, 16)
        }
        .padding(.horizontal, 22)
        .onChange(of: viewModel.bookIsSaved, {
            shouldPresentSheet.toggle()
        })
    }
    
    private func saveBook() {
        viewModel.saveBook(title: title, description: description)
    }
}

#Preview {
    @State var shouldPresentSheet = true
    return CreateBookView(shouldPresentSheet: $shouldPresentSheet)
}
