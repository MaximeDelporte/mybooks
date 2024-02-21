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
    
    private let repository = LibraryRepository()
    
    func fetchBooks() {
        state = .loading
        
        repository.fetchBooks(completion: { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(books):
                self.state = .loaded(books: books)
            case let .failure(error):
                print("manage error: \(error)")
            }
        })
    }
}
