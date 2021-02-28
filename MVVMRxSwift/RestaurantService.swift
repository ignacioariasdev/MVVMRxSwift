//
//  RestaurantService.swift
//  MVVMRxSwift
//
//  Created by Ignacio Arias on 2021-02-27.
//

///https://www.youtube.com/watch?v=kraICEpu7Qg&ab_channel=JamesHaville
import Foundation
import RxSwift

protocol RestaurantServiceProtocol {
    func fetchRestaurantsFromLocalFile() -> Observable<[Restaurant]>
}

//To parse the Struct
class RestaurantService: RestaurantServiceProtocol {
    
    // MARK: - From JSON local file
    func fetchRestaurantsFromLocalFile() -> Observable<[Restaurant]> {
        
        return Observable.create { (observer) -> Disposable in
            //Pass the jsonFile to the observer which is obsevable
            
            guard let path = Bundle.main.path(forResource: "restaurants", ofType: ".json") else {
                observer.onError(NSError(domain: "", code: -1, userInfo: nil))
                return Disposables.create { }
            }
            
            do {
                //Read the file at the path
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedRead)
                let restaurants = try JSONDecoder().decode([Restaurant].self, from: data)
                observer.onNext(restaurants)
                
            } catch(let error) { //implicit no net food (let error)
                observer.onError(error)
            }
            return Disposables.create { }
        }
    }
    
    // MARK: - Fetch from URL
//    func fetchRestaurantsFromURL() -> Observable<[Restaurant]> {
//
//        return Observable.create { (observer) -> Disposable in
//            //Pass the jsonFile to the observer which is obsevable
//
//            //Wrap until the catch
//            let task = URLSession.shared.dataTask(with: URL(string: "url-here")!) { (data, response, error) in
//
//                guard let data = data else {
//                    observer.onError(NSError(domain: "", code: -1, userInfo: nil))
//                    return
//                }
//
//                do {
//                    //Read the file at the path
//                    let restaurants = try JSONDecoder().decode([Restaurant].self, from: data)
//                    observer.onNext(restaurants)
//
//                } catch(let error) { //implicit no net food (let error)
//                    observer.onError(error)
//                }
//
//            }
//            task.resume()
//
//            return Disposables.create {
//                task.cancel()
//            }
//        }
//    }
}
