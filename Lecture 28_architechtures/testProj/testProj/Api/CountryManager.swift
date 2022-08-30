//
//  CountryManager.swift
//  testProj
//
//  Created by Marika Kalandia on 29.08.22.
//

import Foundation

protocol CountriesManagerProtocol: AnyObject {
    func fetchCountries(completion: @escaping (([Country]) -> Void))
}

class CountriesManager: CountriesManagerProtocol {
    
    func fetchCountries(completion: @escaping (([Country]) -> Void)) {
        let url = "https://restcountries.com/v3.1/all"
        NetworkManager.shared.get(url: url) { (result: Result<[Country], Error>) in
            switch result {
            case .success(let countries):
                completion(countries)
            case .failure(let error):
                print(error)
            }
        }
    }
}
