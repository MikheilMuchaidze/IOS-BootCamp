//
//  CountriesConfigurator.swift
//  CleanSwift_Academy
//
//  Created by Giorgi Bostoghanashvili on 28.08.22.
//


import Foundation

enum CountriesConfigurator {
    static func configure() -> CountriesViewController {
        let apiManager = APIManager()
        let worker = CountriesWorker(apiManager: apiManager)
        let presenter = CountriesPresenter()
        let interactor = CountriesInteractor(presenter: presenter, worker: worker)
        let router = CountriesRouter(dataStore: interactor)
        let viewController = CountriesViewController(interactor: interactor, router: router)
        presenter.viewController = viewController
        router.viewController = viewController
        
        return viewController
    }
}
