//
//  SwiftUIView.swift
//  Guide2Houston
//
//  Created by Elena Margolin on 7/26/22.
//

import SwiftUI

struct FavoriteView: View {
    @EnvironmentObject var favorites: Favorites
    
    var body: some View {
        VStack {
            if favorites.count > 0 {
                List {
                    ForEach(favorites.items) { restaurant in
                        NavigationLink(destination: FavoriteCardView(restaurant: restaurant).environmentObject(favorites)) {
                            RestaurantRow(restaurant: restaurant)
                        }
                    }
                }
            } else {
                Text("No favorite restaurants").foregroundColor(.gray)
            }
        }.navigationTitle("Favorites")
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
            .environmentObject(Favorites())
    }
}
