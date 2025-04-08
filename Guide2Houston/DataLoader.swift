//
//  DataLoader.swift
//  Guide2Houston
//
//  Created by Elena Margolin on 7/26/22.
//

import Foundation

public class DataLoader {
    @Published var restaurantData = [RestaurantData]()

    init() {
        load()
    }

    func load() {
        if let fileLocation = Bundle.main.url(forResource: "restaurants", withExtension: "json") {
            
            do {
                let data = try Data(contentsOf: fileLocation)
                let jsonDecoder = JSONDecoder()
                let dataFromJson = try jsonDecoder.decode([RestaurantData].self, from: data)
                
                self.restaurantData = dataFromJson
                
            } catch {
                print(error)
            }
        }
    }
}
