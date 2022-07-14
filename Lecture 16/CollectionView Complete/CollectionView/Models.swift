//
//  Models.swift
//  CollectionView
//
//  Created by Vasili Baramidze on 13.07.22.
//

import Foundation
import UIKit

class Country: Hashable {
    
    static func == (lhs: Country, rhs: Country) -> Bool {
        lhs.uiid == rhs.uiid
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(uiid)
        hasher.combine(id)
    }
    
    var uiid = UUID()
    var id: Int
    var name: String
    var population: UInt
    
    var flag: UIImage {
        let resourceName = "country_"+"\(id)"
        return UIImage(named: resourceName)!
    }
    
    init(id: Int, name: String, population: UInt) {
        print(uiid)
        self.id = id
        self.name = name
        self.population = population
    }
}

extension Country {
    
    static let allCountry = [
        Country(id: 1  , name:  "China", population:  1_440_000_000),
        Country(id: 2  , name:  "India", population:  1_370_000_000),
        Country(id: 3  , name:  "United States", population:  330_600_000),
        Country(id: 4  , name:  "Indonesia", population:  273_524_000),
        Country(id: 5  , name:  "Pakistan", population:  220_892_000),
        Country(id: 6  , name:  "Brazil", population:  212_675_000),
        Country(id: 7  , name:  "Nigeria", population:  206_140_000),
        Country(id: 8  , name:  "bangladesh", population:  171_000_000),
        Country(id: 9  , name:  "Mexico", population:  128_933_000),
        Country(id: 10 , name:  "Japan", population: 125_930_000),
        Country(id: 11 , name:  "Philippines", population: 108_000_000),
        Country(id: 12 , name:  "Egypt", population: 101_097_000),
        Country(id: 13 , name:  "Ethiopia", population: 114_964_000),
        Country(id: 14 , name:  "Vietnam", population: 96_209_000),
        Country(id: 15 , name:  "Iran", population: 83_993_000),
        Country(id: 16 , name:  "Turkey", population: 83_155_000),
        Country(id: 17 , name:  "Germany", population: 83_218_000),
        Country(id: 18 , name:  "France", population: 67_422_000),
        Country(id: 19 , name:  "Georgia", population: 3_714_000),
        Country(id: 20 , name:  "Macedonia", population: 2_083_000)
    ]
}
