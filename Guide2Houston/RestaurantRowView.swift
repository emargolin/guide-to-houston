//
//  RestaurantRowView.swift
//  Guide2Houston
//
//  Created by Elena Margolin on 7/26/22.
//

import Foundation
import SwiftUI

struct RestaurantRow: View {
    var restaurant: RestaurantData
    var body: some View {
        HStack {
            Image(restaurant.image).resizable().aspectRatio(contentMode: .fill).frame(width: 48.0, height: 48.0, alignment: .center).clipped().padding(.trailing, 10)
            Text("\(restaurant.name)")
            Spacer()
            Image(systemName: "star")
            Text("\(restaurant.rating)")
        }
    }
}

struct RestaurantRow_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantRow(restaurant: dummyRestaurant)
    }
}
