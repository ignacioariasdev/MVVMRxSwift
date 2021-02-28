//
//  Restaurant.swift
//  MVVMRxSwift
//
//  Created by Ignacio Arias on 2021-02-27.
//

import Foundation


//Map Json
struct Restaurant: Decodable {
    let name: String
    let cuisine: Cuisine
}

enum Cuisine: String, Decodable {
    case european
    case indian
    case mexican
    case french
    case english
}
