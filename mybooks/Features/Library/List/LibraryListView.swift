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
    
    @State private var shouldPresentSheet = false
    @ObservedObject private var viewModel = LibraryListViewModel()
    
    var body: some View {
        VStack {
            if let books = viewModel.books {
                Text("There is \(books.count) books.")
            } else {
                EmptyView(shouldPresentSheet: $shouldPresentSheet)
            }
        }
        .sheet(isPresented: $shouldPresentSheet) {
            print("Sheet dismissed!")
        } content: {
            CreateBookView(shouldPresentSheet: $shouldPresentSheet)
        }
        .padding(.horizontal, 22)
        .onAppear {
            Task {
                await viewModel.fetchBooks()
            }
        }
    }
}

// MARK: - Empty State

private struct EmptyView: View {
    
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
    @State var path: NavigationPath = .init()
    return LibraryListView(path: $path)
}
