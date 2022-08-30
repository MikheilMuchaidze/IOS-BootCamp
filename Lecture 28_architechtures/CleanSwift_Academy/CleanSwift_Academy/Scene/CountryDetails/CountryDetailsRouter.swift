//
//  CountryDetailsRouter.swift
//  CleanSwift_Academy
//
//  Created by Giorgi Bostoghanashvili on 28.08.22.
//


import UIKit

protocol CountryDetailsRoutingLogic { }

protocol CountryDetailsDataPassing {
    var dataStore: CountryDetailsDataStore { get }
}

final class CountryDetailsRouter: CountryDetailsRoutingLogic, CountryDetailsDataPassing {
    // MARK: - Clean Components
    
    weak var viewController: CountryDetailsViewController?
    private(set) var dataStore: CountryDetailsDataStore
    
    // MARK: - Object Lifecycle
    
    init(dataStore: CountryDetailsDataStore) {
        self.dataStore = dataStore
    }
}
