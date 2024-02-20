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
}
