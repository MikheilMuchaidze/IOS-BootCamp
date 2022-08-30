//
//  CountryUrlBuilder.swift
//  Countries_VIPER
//
//  Created by Vasili Baramidze on 28.08.22.
//  Copyright © 2022 Vasili Baramidze. All rights reserved.
//

import Foundation

class CountryUrlBuilder {
    
    static let shared = CountryUrlBuilder()
    
    private(set) var urlString: String
    
    init() {
        urlString = "https://restcountries.com/v2/all"
    }
}
