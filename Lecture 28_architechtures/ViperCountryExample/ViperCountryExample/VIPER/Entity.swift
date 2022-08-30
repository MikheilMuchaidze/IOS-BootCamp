//
//  Entity.swift
//  ViperCountryExample
//
//  Created by Vasili Baramidze on 29.08.22.
//

import Foundation

//MARK: - Models
struct Country: Codable {
    let name: String
    let capital: String?
    let population: Int
    let flag: String
}
