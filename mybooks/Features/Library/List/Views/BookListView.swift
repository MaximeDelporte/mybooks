//
//  BookListView.swift
//  mybooks
//
//  Created by Maxime Delporte on 21/02/2024.
//

import Foundation
import SwiftUI

struct BookListView: View {
    
    var books: [Book]
    @Binding var shouldPresentSheet: Bool
    
    var body: some View {
        ScrollView {
            ForEach(books) { book in
                HStack(alignment: .top, content: {
                    Image("placeholder")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 80, height: 120)
                        .cornerRadius(8.0)
                        .clipped()
                    
                    VStack(spacing: 4) {
                        Text(book.title)
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(.primary)
                            .font(.system(size: 18, weight: .semibold, design: .rounded))
                            .lineLimit(2)
                        
                        Text(book.description)
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular, design: .rounded))
                            .lineLimit(4)
                    }
                    .padding(.leading, 8)
                    
                    Spacer()
                })
                .padding(.top, 12)
            }
        }
        .padding(.vertical, 8)
        .scrollIndicators(.hidden)
        .clipped()
        
        MBButton(title: "Add A Book", style: .primary, action: {
            shouldPresentSheet.toggle()
        })
        .padding(.bottom, 16)
    }
}

#Preview {
    let books: [Book] = [
        Book(id: "", userId: "", title: "Lean In", description: "Woman, Work, and the Will to Lead Sheryl Sandberg.", createdAt: Date()),
        Book(id: "", userId: "", title: "The 7 Habits of Highly Effective People", description: "Lean the habits of thos who achieve everything.", createdAt: Date()),
        Book(id: "", userId: "", title: "Radical Candor", description: "Be a kickass boss without losing your humanity", createdAt: Date()),
        Book(id: "", userId: "", title: "Radical Candor", description: "Be a kickass boss without losing your humanity", createdAt: Date()),
        Book(id: "", userId: "", title: "Radical Candor", description: "Be a kickass boss without losing your humanity", createdAt: Date()),
        Book(id: "", userId: "", title: "Radical Candor", description: "Be a kickass boss without losing your humanity", createdAt: Date())
    ]
    @State var shouldPresentSheet = false
    return BookListView(
        books: books,
        shouldPresentSheet: $shouldPresentSheet
    )
}
