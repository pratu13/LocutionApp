//
//  LocutionApp.swift
//  Shared
//
//  Created by Pratyush  on 4/13/21.
//

import SwiftUI
import CoreData

@main
struct LocutionApp: App {
    let persistanceContainer = PersistanceController.shared
    @StateObject var viewModel: AppViewModel = AppViewModel()
    
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = .clear
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().tintColor = .white
      }
    
    var body: some Scene {
        WindowGroup {
            TabView {
                ContentView()
                    .environmentObject(viewModel)
                    .tabItem {
                        Image(systemName: "house")
                    }
                NavigationView {
                    SearchView()
                        .environmentObject(viewModel)
                        .navigationTitle("Search")
                }
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
                
                WordCardView(word: FavouriteWord(word: Model.word, show: false, appear: false))
                    .environmentObject(viewModel)
                    .tabItem {
                        Image(systemName: "bell")
                    }
            }
            .background(Colors.Palette.cupid.color)
        }
    }
}
