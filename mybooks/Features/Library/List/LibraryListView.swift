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
    @ObservedObject var viewModel: LibraryListViewModel
    
    @State private var shouldPresentSheet = false
    
    var body: some View {
        VStack {
            switch viewModel.state {
            case .loading:
                ProgressView()
            case .loaded(let books):
                if books.isEmpty {
                    EmptyView(shouldPresentSheet: $shouldPresentSheet)
                } else {
                    ListView(books: books, shouldPresentSheet: $shouldPresentSheet)
                }
            }
        }
        .sheet(isPresented: $shouldPresentSheet, content: {
            CreateBookView(
                shouldPresentSheet: $shouldPresentSheet,
                completion: { book in
                    viewModel.add(local: book)
                    shouldPresentSheet.toggle()
                }
            )
        })
        .padding(.horizontal, 22)
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

// MARK: - Loaded State

private struct ListView: View {
    
    var books: [Book]
    @Binding var shouldPresentSheet: Bool
    
    var body: some View {
        ForEach(books) { book in
            Text("Title: \(book.title) - \(book.description)")
        }
        
        Spacer()
        
        MBButton(title: "Add A Book", style: .primary, action: {
            shouldPresentSheet.toggle()
        })
        .padding()
    }
}

#Preview {
    @State var viewModel = LibraryListViewModel()
    @State var path: NavigationPath = .init()
    return LibraryListView(path: $path, viewModel: viewModel)
}
