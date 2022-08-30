//
//  CountriesRouter.swift
//  CleanSwift_Academy
//
//  Created by Giorgi Bostoghanashvili on 28.08.22.
//

import UIKit

protocol CountriesRoutingLogic {
    func navigateToCountryDetails()
}

protocol CountriesDataPassing {
    var dataStore: CountriesDataStore { get }
}

final class CountriesRouter: CountriesRoutingLogic, CountriesDataPassing {
    // MARK: - Clean Components
    
    weak var viewController: CountriesViewController?
    private(set) var dataStore: CountriesDataStore
    
    // MARK: - Object Lifecycle
    
    init(dataStore: CountriesDataStore) {
        self.dataStore = dataStore
    }
    
    // MARK: - Routing
    
    func navigateToCountryDetails() {
        guard let selectedCountry = dataStore.selectedCountry else { return }
        let destinationVC = CountryDetailsConfigurator.configure(with: selectedCountry)
        viewController?.navigationController?.pushViewController(destinationVC, animated: true)
    }
}
