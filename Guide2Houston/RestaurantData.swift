//
//  RestaurantData.swift
//  Guide2Houston
//
//  Created by Elena Margolin on 7/26/22.
//

import Foundation


struct RestaurantData: Codable, Identifiable, Equatable {
    var id = UUID()
    var image: String
    var name: String
    var location: String
    var cuisine: String
    var rating: Int
    var comment: String
}
