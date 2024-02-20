//
//  LibraryRepository.swift
//  mybooks
//
//  Created by Maxime Delporte on 18/02/2024.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class LibraryRepository {
    
    private let db = Firestore.firestore()
    
    func fetchBooks() async {
        guard let user = Auth.auth().currentUser,
              let snapshot = try? await db.collection("books").getDocuments() else { return }
        print("SNAPSHOT: \(snapshot)")
    }
}
