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
    
    func fetchBooks() {
        repository.fetchBooks(completion: { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(books):
                self.books = books
            case let .failure(error):
                print("manage error: \(error)")
            }
        })
    }
}
