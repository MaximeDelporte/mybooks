//
//  LibraryListViewModel.swift
//  mybooks
//
//  Created by Maxime Delporte on 18/02/2024.
//

import Foundation

class LibraryListViewModel: ObservableObject {
    
    enum State {
        case loading
        case loaded(books: [Book])
    }
    
    @Published var state: State = .loading
    
    private var books = [Book]()
    private let repository = LibraryRepository()
    
    func fetchBooks() {
        state = .loading
        
        repository.fetchBooks(completion: { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(books):
                let sortedBooks = books.sorted { $0.createdAt < $1.createdAt }
                self.books = sortedBooks
                self.state = .loaded(books: sortedBooks)
            case let .failure(error):
                print("manage error: \(error)")
            }
        })
    }
    
    func add(local book: Book) {
        self.books.append(book)
        self.state = .loaded(books: self.books)
    }
}
