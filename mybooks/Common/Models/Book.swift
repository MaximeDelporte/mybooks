//
//  Book.swift
//  mybooks
//
//  Created by Maxime Delporte on 18/02/2024.
//

import Foundation

struct Book: Hashable, Identifiable, Codable {
    let id: String
    let userId: String
    let title: String
    let description: String
}
