//
//  ExploreViewModel.swift
//  Guide2Houston
//
//  Created by Elena Margolin on 7/30/22.
//

import Foundation

enum Location: String, CaseIterable, Identifiable {
    case all,
         westheimer,
         upperkirby = "upper kirby",
         downtown,
         ricevillage = "rice village",
         heights,
         midtown,
         montrose,
         chinatown
    
    var id: Self { self }
}

enum Cuisine: String, CaseIterable, Identifiable {
    case all, bar, coffee, club, sushi, taco, mexican, japanese, pho,
    healthy, vietnamese, chinese, burger, bakery,
    icecream = "ice cream"
    
    var id: Self { self }
}
