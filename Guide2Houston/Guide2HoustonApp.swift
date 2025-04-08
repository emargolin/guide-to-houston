//
//  Guide2HoustonApp.swift
//  Guide2Houston
//
//  Created by Elena Margolin on 7/16/22.
//

import SwiftUI

@main
struct Guide2HoustonApp: App {
    @StateObject var favorites = Favorites()
    
    var body: some Scene {
        WindowGroup {
            TabView {
                NavigationView {
                    ExploreView()
                        .environmentObject(favorites)
                }
                .tabItem {
                    Image(systemName: "bag")
                    Text("Explore")
                }
                
                NavigationView {
                    FavoriteView()
                        .environmentObject(favorites)
                }
                .tabItem {
                    Image(systemName: "star")
                    Text("Favorites")
                }
                
                NavigationView {
                    ProfileView()
                        .environmentObject(favorites)
                }
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Profile")
                }
            }
            
        }

    }
}
