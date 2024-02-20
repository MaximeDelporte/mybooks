//
//  LibraryRepository.swift
//  mybooks
//
//  Created by Maxime Delporte on 20/02/2024.
//

import FirebaseDatabase
import FirebaseAuth
import FirebaseFirestore
import Foundation
import SwiftUI

class LibraryRepository: ObservableObject {
    
    @Published private var user: FirebaseAuth.User?
    private let db = Firestore.firestore()
    
    typealias SaveCompletion = (Result<Void, Error>) -> Void
    typealias FetchCompletion = (Result<[Book], Error>) -> Void
    
    init() {
        self.user = Auth.auth().currentUser
    }
}

// MARK: - Convenience Methods

extension LibraryRepository {
    
    func saveBook(
        with title: String,
        and description: String,
        completion: @escaping SaveCompletion
    ) {
        guard let user = user else { return }
        let ref = db.collection("books").document()
        
        let data: [String: Any] = [
            "id": ref.documentID,
            "title": title,
            "description": description,
            "userId": user.uid
        ]
         
        ref.setData(data, completion: { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(()))
            }
        })
    }
    
    func fetchBooks(completion: @escaping FetchCompletion) {
        guard let user = user else { return }
        
        let docRef = db.collection("books").whereField("userId", isEqualTo: user.uid)
        
        docRef.getDocuments(completion: { snapshot, error in
            if let error = error {
                completion(.failure(error))
            } else if let snapshot = snapshot {
                do {
                    let books = try snapshot.documents.compactMap { try $0.data(as: Book.self) }
                    completion(.success(books))
                }
                catch {
                    print(error)
                    completion(.failure(error))
                }
            }
        })
    }
}
