//
//  FavoriteCardView.swift
//  Guide2Houston
//
//  Created by Elena Margolin on 7/27/22.
//

import SwiftUI

struct FavoriteCardView: View {
    @EnvironmentObject var favorites: Favorites
    var restaurant: RestaurantData
    
    var body: some View {
        VStack () {
            Image(restaurant.image).resizable().scaledToFit()
            HStack {
                Text(restaurant.name).fontWeight(.bold).font(.title)
                Spacer()
                Image(systemName: "star")
                Text(String(restaurant.rating))
            }.padding()
            VStack (alignment: .leading, spacing: 16) {
                HStack {
                    Image(systemName: "mappin.circle")
                    Text(restaurant.location)
                    Spacer()
                }
                HStack {
                    Image(systemName: "flame")
                    Text(restaurant.cuisine)
                    Spacer()
                }
                Text(restaurant.comment)
            }.padding([.leading, .bottom], 20)
            
            Divider()
            Button("Remove from Favorites") {
                favorites.remove(item: restaurant)
            }.font(.headline).padding(.top, 20)
            Spacer()
        }
    }
}

struct FavoriteCardView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteCardView(restaurant: dummyRestaurant)
            .environmentObject(Favorites())
    }
}

