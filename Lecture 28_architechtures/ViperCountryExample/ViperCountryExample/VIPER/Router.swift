//
//  Router.swift
//  ViperCountryExample
//
//  Created by Vasili Baramidze on 29.08.22.
//

import Foundation
import UIKit

typealias ListEntryPoint = ListViewProtocol & UIViewController

protocol ListRouter {
    var entryPoint: ListEntryPoint?  { get }
    static func start() -> ListRouter
    func presentCountryDetailScreen(from view: ListViewProtocol, for country: Country)
}

class CountryListRouter: ListRouter {

    var entryPoint: ListEntryPoint?
    
    static func start() -> ListRouter {

        let router = CountryListRouter()
        
        var view: ListViewProtocol = CountryListViewController()
        var interactor: ListInteractorProtocol = CountryListIteractor()
        var presenter: ListPresenterProtocol = CountryListPresenter()
        
        view.presenter = presenter
        interactor.presenter = presenter
        
        presenter.router = router
        presenter.view = view
        presenter.interactor = interactor
        
        router.entryPoint = view as? ListEntryPoint
        
        return router
    }
    
    func presentCountryDetailScreen(from view: ListViewProtocol, for country: Country) {
        
        let countryDetailVC = CountryDetailRouter.createCountryDetailRouterModule(with: country)
        
        guard let viewVC = view as? UIViewController else {
            fatalError("Invalid View Protocol type")
        }
        
        viewVC.present(countryDetailVC, animated: true)
    }
}
