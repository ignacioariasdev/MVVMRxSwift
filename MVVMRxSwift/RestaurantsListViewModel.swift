//
//  RestaurantsListViewModel.swift
//  MVVMRxSwift
//
//  Created by Ignacio Arias on 2021-02-27.
//

import Foundation
import RxSwift

final class RestaurantsListViewModel {
     let title = "Restaurants"
    
    private let restaurantService: RestaurantServiceProtocol
    
    //Inject restaurantService into the init
    init(restaurantService: RestaurantServiceProtocol = RestaurantService()) { // On this way, when testing our viewModel we want to be able to abstract away the fetchRestaurantsMethod, so we can return some fake data, and we don't have to test the method fetchRestaurants() from the service, along with our viewModel
        
        self.restaurantService = restaurantService
    }
    
    //When the viewController loads its view we want to be able to fetch the data
    func fetchRestaurantViewModels() -> Observable<[RestaurantViewModel]> { //Retrieving each value as a viewModel
        
        
        restaurantService.fetchRestaurantsFromLocalFile().map({ $0.map({
            RestaurantViewModel(restaurant: $0) }) }) //Subscribing to receive a stream of restaurants
        
        //What we want is to send to the ViewController the array of RestaurantViewModel
        //So what we need is to convert restaurants into the stream of restaurantsViewModels with the operator Map, now we need to import RxSwift for Observable type
        
        //Now go back to restaurantService.fetchRestaurantsFromLocalFile() and implement .Map, and then .map again to convert a restaurant into a restaurantViewModel
        
    }
    
}
