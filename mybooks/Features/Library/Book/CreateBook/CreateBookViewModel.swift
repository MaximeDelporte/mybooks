//
//  CreateBookViewModel.swift
//  mybooks
//
//  Created by Maxime Delporte on 20/02/2024.
//

import Foundation
import SwiftUI

class CreateBookViewModel: ObservableObject {
    
    @Published var bookIsSaved: Bool = false
    
    func saveBook(title: String, description: String) {
        bookIsSaved = true
    }
}
