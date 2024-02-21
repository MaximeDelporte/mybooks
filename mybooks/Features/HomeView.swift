//
//  HomeView.swift
//  mybooks
//
//  Created by Maxime Delporte on 18/02/2024.
//

import Foundation
import SwiftUI

struct HomeView: View {
    
    @State var tabSelection: Int = 0
    @State var path: NavigationPath = .init()
    
    @EnvironmentObject var repository: AuthRepository
    @State var viewModel = LibraryListViewModel()
    
    private let navTitles = ["My Books", "Settings"]
    
    var body: some View {
        NavigationStack(path: $path) {
            TabView(selection: $tabSelection) {
                ForEach(0...1, id: \.self) { index in
                    let firstPage = index == 0
                    
                    if firstPage {
                        LibraryListView(path: $path, viewModel: viewModel)
                            .tabItem {
                                Label(title: {
                                    Text("Library")
                                }, icon: {
                                    Image("library-icon")
                                })
                            }
                    } else {
                        SettingsView()
                            .tabItem {
                                Label(title: {
                                    Text("Settings")
                                }, icon: {
                                    Image("settings-icon")
                                })
                            }
                            .environmentObject(viewModel)
                    }
                }
            }
            .tint(.primary)
            .navigationTitle(navTitles[tabSelection])
            .navigationDestination(for: Book.self, destination: { book in
                LibraryDetailView(book: book)
            })
        }
        .onAppear {
            let backgroundColor = UIColor.white
            UITabBar.appearance().barTintColor = backgroundColor
            UITabBar.appearance().backgroundColor = backgroundColor
            
            viewModel.fetchBooks()
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(AuthRepository())
}
