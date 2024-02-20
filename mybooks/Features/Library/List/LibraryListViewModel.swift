//
//  LibraryListViewModel.swift
//  mybooks
//
//  Created by Maxime Delporte on 18/02/2024.
//

import Foundation

class LibraryListViewModel: ObservableObject {
    
    @Published var books: [Book]?
    
    private let repository = LibraryRepository()
    
    func getBooks() async {
        await repository.fetchBooks()
    }
}
