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
                    EmptyListView(shouldPresentSheet: $shouldPresentSheet)
                } else {
                    BookListView(books: books, shouldPresentSheet: $shouldPresentSheet)
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

#Preview {
    @State var viewModel = LibraryListViewModel()
    @State var path: NavigationPath = .init()
    return LibraryListView(path: $path, viewModel: viewModel)
}
