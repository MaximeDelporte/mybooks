//
//  User.swift
//  mybooks
//
//  Created by Maxime Delporte on 18/02/2024.
//

import Foundation

struct User: Identifiable, Codable {
    let id: String
    let firstName: String
    let lastName: String
    let email: String
    let books: [Book]
}

extension User {
    static var MOCK_USER = User(id: "123", firstName: "Maxime", lastName: "Delporte", email: "email@email.com", books: Book.MOCK_BOOKS)
}
