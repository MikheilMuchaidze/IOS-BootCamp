//
//  Models.swift
//  TableView
//
//  Created by Vasili Baramidze on 11.07.22.
//

import Foundation

class Country {
    
    static let countries = [
        Country(name: "Georgia", flag: "🇬🇪", population: 4_000_000),
        Country(name: "Italy", flag: "🇮🇹", population: 43_000_000),
        Country(name: "Germany", flag: "🇩🇪", population: 90_000_000),
        Country(name: "japan", flag: "🇯🇵", population: 27_000_000),
        Country(name: "usa", flag: "🇯🇵", population: 88_000_000),
        Country(name: "france", flag: "🇫🇷", population: 90_000_000)
    ]
    
    let name: String
    let flag: String
    let population: UInt
    
    init(name: String, flag: String, population: UInt) {
        self.name = name
        self.flag = flag
        self.population = population
    }
}
