//
//  RestaurantViewModel.swift
//  MVVMRxSwift
//
//  Created by Ignacio Arias on 2021-02-27.
//

import Foundation

struct RestaurantViewModel {
    
    private let restaurant: Restaurant
    
    // MARK: - Computed property that takes restaurant and convert it to what we want to see in the display
    var displayText: String {
        return restaurant.name + " - " + restaurant.cuisine.rawValue.capitalized  //RawValue is thanks to conforming the string
    }
    
    init(restaurant: Restaurant) {
        self.restaurant = restaurant
    }
}
