//
//  ContentView.swift
//  Guide2Houston
//
//  Created by Elena Margolin on 7/16/22.
//

import SwiftUI

struct ExploreView: View {
    @EnvironmentObject var favorites: Favorites
    @State private var searchText = ""
    
    @State private var selectedLocation: Location = .all
    @State private var selectedCuisine: Cuisine = .all
    @State private var toprated = false

    let restaurants = DataLoader().restaurantData
    
    var body: some View {
        VStack {
            if (filteredRestaurants.count > 0) {
                List {
                        ForEach(filteredRestaurants) { restaurant in
                            NavigationLink(destination: RestaurantCardView(restaurant: restaurant).environmentObject(favorites)) {
                                RestaurantRow(restaurant: restaurant)
                            }
                        }
                }.searchable(text: $searchText, prompt: "Search for a restaurant")
            } else {
                Text("No restaurants").foregroundColor(.gray)
            }
        }
        .navigationTitle("Explore")
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Menu {
                    Menu {
                        Picker("Location", selection: $selectedLocation) {
                            ForEach(Location.allCases) { location in
                                Text(location.rawValue.capitalized)
                            }
                        }
                    } label: {
                        Label("Location", systemImage: "mappin.circle")
                    }
                    
                    Menu {
                        Picker("Cuisine", selection: $selectedCuisine) {
                            ForEach(Cuisine.allCases) { cuisine in
                                Text(cuisine.rawValue.capitalized) }
                        }
                    } label: {
                        Label("Cuisine", systemImage: "flame")
                    }
                    
                    Button {
                        toprated = true
                    } label: {
                        Label("Top Rated", systemImage: "star")
                    }
                    Button(role: .destructive) {
                        selectedLocation = .all
                        selectedCuisine = .all
                        toprated = false
                    } label: {
                        Text("Clear Filters")
                    }
                } label: {
                    Label("Sort", systemImage: "slider.vertical.3")
                }
            }
        }
    }
    
    var sortedRestaurantsByLocation : [RestaurantData] {
        switch selectedLocation {
        case .all:
            return restaurants
        case .westheimer:
            return restaurants.filter {$0.location.localizedCaseInsensitiveContains("westheimer")}
        case .upperkirby:
            return restaurants.filter {$0.location.localizedCaseInsensitiveContains("upper kirby")}
        case .downtown:
            return restaurants.filter {$0.location.localizedCaseInsensitiveContains("downtown")}
        case .ricevillage:
            return restaurants.filter {$0.location.localizedCaseInsensitiveContains("rice")}
        case .heights:
            return restaurants.filter {$0.location.localizedCaseInsensitiveContains("heights")}
        case .midtown:
            return restaurants.filter {$0.location.localizedCaseInsensitiveContains("midtown")}
        case .montrose:
            return restaurants.filter {$0.location.localizedCaseInsensitiveContains("montrose")}
        case .chinatown:
            return restaurants.filter {$0.location.localizedCaseInsensitiveContains("chinatown")}
        }
    }
    
    var sortedRestaurantsByLocationAndCuisine : [RestaurantData] {
        switch selectedCuisine {
        case .all:
            return sortedRestaurantsByLocation
        case .bar:
            return sortedRestaurantsByLocation.filter {$0.cuisine.localizedCaseInsensitiveContains("bar")}
        case .coffee:
            return sortedRestaurantsByLocation.filter {$0.cuisine.localizedCaseInsensitiveContains("coffee")}
        case .club:
            return sortedRestaurantsByLocation.filter {$0.cuisine.localizedCaseInsensitiveContains("club")}
        case .sushi:
            return sortedRestaurantsByLocation.filter {$0.cuisine.localizedCaseInsensitiveContains("sushi")}
        case .taco:
            return sortedRestaurantsByLocation.filter {$0.cuisine.localizedCaseInsensitiveContains("taco")}
        case .mexican:
            return sortedRestaurantsByLocation.filter {$0.cuisine.localizedCaseInsensitiveContains("mexican")}
        case .japanese:
            return sortedRestaurantsByLocation.filter {$0.cuisine.localizedCaseInsensitiveContains("japanese")}
        case .pho:
            return sortedRestaurantsByLocation.filter {$0.cuisine.localizedCaseInsensitiveContains("pho")}
        case .healthy:
            return sortedRestaurantsByLocation.filter {$0.cuisine.localizedCaseInsensitiveContains("healthy")}
        case .vietnamese:
            return sortedRestaurantsByLocation.filter {$0.cuisine.localizedCaseInsensitiveContains("vietnamese")}
        case .chinese:
            return sortedRestaurantsByLocation.filter {$0.cuisine.localizedCaseInsensitiveContains("chinese")}
        case .burger:
            return sortedRestaurantsByLocation.filter {$0.cuisine.localizedCaseInsensitiveContains("burger")}
        case .bakery:
            return sortedRestaurantsByLocation.filter {$0.cuisine.localizedCaseInsensitiveContains("bakery")}
        case .icecream:
            return sortedRestaurantsByLocation.filter {$0.cuisine.localizedCaseInsensitiveContains("ice cream")}
        }
    }
    
    var allSortedRestaurants: [RestaurantData] {
        if toprated {
            return sortedRestaurantsByLocationAndCuisine.filter {$0.rating >= 5}
        } else {
            return sortedRestaurantsByLocationAndCuisine
        }
    }
    
    var filteredRestaurants: [RestaurantData] {
        if searchText.isEmpty {
            return allSortedRestaurants
        } else {
            return allSortedRestaurants.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
            .environmentObject(Favorites())
    }
}
