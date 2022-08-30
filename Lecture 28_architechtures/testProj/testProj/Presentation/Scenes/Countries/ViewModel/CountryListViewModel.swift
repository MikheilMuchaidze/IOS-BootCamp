//
//  CountryListViewModel.swift
//  testProj
//
//  Created by Marika Kalandia on 29.08.22.
//

import UIKit

protocol CountriesListViewModelProtocol: AnyObject {
    func getCountriesList(completion: @escaping (([CountryViewModel]) -> Void))
    
    init(with countriesManager: CountriesManagerProtocol)
}

class CountriesListViewModel: CountriesListViewModelProtocol {
    
    let countriesManager: CountriesManagerProtocol
    
    required init(with countriesManager: CountriesManagerProtocol)  {
        self.countriesManager = countriesManager
    }
    
    func getCountriesList(completion: @escaping (([CountryViewModel]) -> Void)) {
        countriesManager.fetchCountries { countries in
            DispatchQueue.main.async {
                
                let countriesViewModels =  countries.map { CountryViewModel(country: $0) }
                completion(countriesViewModels)
            }
        }
    }
    
}
