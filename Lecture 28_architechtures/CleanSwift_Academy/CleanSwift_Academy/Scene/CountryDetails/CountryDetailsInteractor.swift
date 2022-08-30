//
//  CountryDetailsInteractor.swift
//  CleanSwift_Academy
//
//  Created by Giorgi Bostoghanashvili on 28.08.22.
//


import UIKit

protocol CountryDetailsBusinessLogic {
    func getCountry(request: CountryDetails.ShowCountryDetails.Request)
}

protocol CountryDetailsDataStore { }

final class CountryDetailsInteractor: CountryDetailsDataStore {
    // MARK: - Clean Components
    
    private let presenter: CountryDetailsPresentationLogic
    private let selectedCountry: Country
    
    // MARK: - Object Lifecycle
    
    init(presenter: CountryDetailsPresentationLogic, selectedCountry: Country) {
        self.presenter = presenter
        self.selectedCountry = selectedCountry
    }
}

// MARK: - CountryDetailsBusinessLogic

extension CountryDetailsInteractor: CountryDetailsBusinessLogic {
    func getCountry(request: CountryDetails.ShowCountryDetails.Request) {
        presenter.presentSelectedCountry(response: CountryDetails.ShowCountryDetails.Response(country: selectedCountry))
    }
}
