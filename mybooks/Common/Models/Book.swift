//
//  Book.swift
//  mybooks
//
//  Created by Maxime Delporte on 18/02/2024.
//

import Foundation

struct Book: Hashable, Identifiable, Codable {
    let id: String
    let title: String
    let description: String
}

extension Book {
    private static var MOCK_BOOK_1 = Book(id: "1", title: "Learning Go, 2nd Edition", description: """
        Go has rapidly become the preferred language for building web services. Plenty of tutorials are available to teach Go's syntax to developers with experience in other programming languages, but tutorials aren't enough. They don't teach Go's idioms, so developers end up recreating patterns that don't make sense in a Go context. This practical guide provides the essential background you need to write clear and idiomatic Go.

        No matter your level of experience, you'll learn how to think like a Go developer. Author Jon Bodner introduces the design patterns experienced Go developers have adopted and explores the rationale for using them. This updated edition also shows you how Go's generics support fits into the language.
        """
    )
    private static var MOCK_BOOK_2 = Book(id: "2", title: "Fluent Python, 2nd Edition", description: """
        Don't waste time bending Python to fit patterns you've learned in other languages. Python's simplicity lets you become productive quickly, but often this means you aren't using everything the language has to offer. With the updated edition of this hands-on guide, you'll learn how to write effective, modern Python 3 code by leveraging its best ideas.

        Discover and apply idiomatic Python 3 features beyond your past experience. Author Luciano Ramalho guides you through Python's core language features and libraries and teaches you how to make your code shorter, faster, and more readable.
        """
    )
    private static var MOCK_BOOK_3 = Book(id: "3", title: "Fundamentals of Data Engineering", description: """
        Data engineering has grown rapidly in the past decade, leaving many software engineers, data scientists, and analysts looking for a comprehensive view of this practice. With this practical book, you'll learn how to plan and build systems to serve the needs of your organization and customers by evaluating the best technologies available through the framework of the data engineering lifecycle.

        Authors Joe Reis and Matt Housley walk you through the data engineering lifecycle and show you how to stitch together a variety of cloud technologies to serve the needs of downstream data consumers. You'll understand how to apply the concepts of data generation, ingestion, orchestration, transformation, storage, and governance that are critical in any data environment regardless of the underlying technology.
        """
    )
    private static var MOCK_BOOK_4 = Book(id: "4", title: "Clean Code: A Handbook of Agile Software Craftsmanship", description: """
        Even bad code can function. But if code isn’t clean, it can bring a development organization to its knees. Every year, countless hours and significant resources are lost because of poorly written code. But it doesn’t have to be that way.
        """
    )
    private static var MOCK_BOOK_5 = Book(id: "5", title: "Head First Design Patterns, 2nd Edition", description: """
        You know you don't want to reinvent the wheel, so you look to Design Patterns: the lessons learned by those who've faced the same software design problems. With Design Patterns, you get to take advantage of the best practices and experience of others so you can spend your time on something more challenging. Something more fun. This book shows you the patterns that matter, when to use them and why, how to apply them to your own designs, and the object-oriented design principles on which they're based. Join hundreds of thousands of developers who've improved their object-oriented design skills through Head First Design Patterns.
        """
    )
    static var MOCK_BOOKS = [MOCK_BOOK_1, MOCK_BOOK_2, MOCK_BOOK_3, MOCK_BOOK_4, MOCK_BOOK_5]
}
