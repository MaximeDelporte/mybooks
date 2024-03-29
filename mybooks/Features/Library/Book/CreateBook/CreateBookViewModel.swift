//
//  CreateBookViewModel.swift
//  mybooks
//
//  Created by Maxime Delporte on 20/02/2024.
//

import Foundation
import SwiftUI

class CreateBookViewModel: ObservableObject {
    
    @Published var book: Book?
    
    private let repository = LibraryRepository()
    
    func saveBook(title: String, description: String) {
        repository.saveBook(
            with: title,
            and: description,
            completion: { [weak self] result in
                guard let self = self else { return }
                
                switch result {
                case let .success(book):
                    self.book = book
                case let .failure(error):
                    print(error)
                }
            }
        )
    }
}
