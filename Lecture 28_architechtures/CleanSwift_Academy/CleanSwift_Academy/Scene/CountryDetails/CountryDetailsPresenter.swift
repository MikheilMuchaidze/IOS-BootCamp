//
//  CountryDetailsPresenter.swift
//  CleanSwift_Academy
//
//  Created by Giorgi Bostoghanashvili on 28.08.22.
//

import UIKit

protocol CountryDetailsPresentationLogic {
    func presentSelectedCountry(response: CountryDetails.ShowCountryDetails.Response)
}

final class CountryDetailsPresenter {
    // MARK: - Clean Components
    
    weak var viewController: CountryDetailsDisplayLogic?
}

// MARK: - CountryDetailsPresentationLogic

extension CountryDetailsPresenter: CountryDetailsPresentationLogic {
    func presentSelectedCountry(response: CountryDetails.ShowCountryDetails.Response) {
        let countryName = response.country.name ?? "No Name"
        let capital = "Capital of \(countryName) is " + (response.country.capital ?? "Couldn't get any data about Capital of \(countryName)")
        let populationString: String
        
        if let population = response.country.population {
            populationString = "Current Population of \(countryName) is - " + String(population)
        } else {
            populationString = "Couldn't get any data about population of \(countryName)"
        }
        
        viewController?.displaySelectedCountry(viewModel: CountryDetails.ShowCountryDetails.ViewModel(population: populationString, capital: capital))
    }
}
