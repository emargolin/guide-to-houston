//
//  Favorites.swift
//  Guide2Houston
//
//  Created by Elena Margolin on 7/27/22.
//

import Foundation

class Favorites : ObservableObject {
    @Published var items = [RestaurantData]()
    
    var count : Int {
        if items.count > 0 {
            return items.count
        } else {
            return 0
        }
    }
    
    func add(item: RestaurantData) {
        items.append(item)
    }
    
    func remove(item: RestaurantData) {
        if let index = items.firstIndex(of: item) {
            items.remove(at: index)
        }
    }
}
