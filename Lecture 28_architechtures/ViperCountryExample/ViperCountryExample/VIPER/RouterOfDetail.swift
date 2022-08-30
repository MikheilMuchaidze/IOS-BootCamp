//
//  RouterOfDetail.swift
//  ViperCountryExample
//
//  Created by Vasili Baramidze on 29.08.22.
//

import UIKit


protocol CountryDetailRouterProtocol: AnyObject {
    
    static func createCountryDetailRouterModule(with country: Country) -> UIViewController
    func navigateBackToListViewController(from view: CountryDetailViewProtocol)
}

class CountryDetailRouter: CountryDetailRouterProtocol {
    
    static func createCountryDetailRouterModule(with country: Country) -> UIViewController {
        let countryDetailVC = CountryDetailViewController()
        
        let presenter: CountryDetailPresenter & CountryDetailInteractorOutputProtocol = CountryDetailPresenter()
        
        countryDetailVC.presenter = presenter
        presenter.view = countryDetailVC
        
        let interactor: CountryDetailInteractorInputProtocol = CountryDetailInteractor()
        interactor.countryItem = country
        interactor.presenter = presenter
        presenter.interactor = interactor
        let router: CountryDetailRouterProtocol = CountryDetailRouter()
        presenter.router = router
        
        return countryDetailVC
    }
    
    
    func navigateBackToListViewController(from view: CountryDetailViewProtocol) {
        
        guard let viewVC = view as? UIViewController else { fatalError("Invalid view protocol type") }
        
        viewVC.navigationController?.popViewController(animated: true)
    }
}
