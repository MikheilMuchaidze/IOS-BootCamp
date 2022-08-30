//
//  CountryDetailsConfigurator.swift
//  CleanSwift_Academy
//
//  Created by Giorgi Bostoghanashvili on 28.08.22.
//


import Foundation

enum CountryDetailsConfigurator {
    static func configure(with selectedCountry: Country) -> CountryDetailsViewController {
        let presenter = CountryDetailsPresenter()
        let interactor = CountryDetailsInteractor(presenter: presenter, selectedCountry: selectedCountry)
        let router = CountryDetailsRouter(dataStore: interactor)
        let viewController = CountryDetailsViewController(interactor: interactor, router: router)
        presenter.viewController = viewController
        router.viewController = viewController
        
        return viewController
    }
}
