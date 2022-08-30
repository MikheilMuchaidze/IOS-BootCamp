//
//  CountryViewModel.swift
//  testProj
//
//  Created by Marika Kalandia on 29.08.22.
//

import Foundation


struct CountryViewModel {
    
    private var country: Country
    
    init(country: Country) {
        self.country = country
    }
    
    var region: String {
        country.region ?? ""
    }
    
    var capital: String? {
        country.capital?.first ?? ""
    }
    
}
