//
//  Presenter.swift
//  ViperCountryExample
//
//  Created by Vasili Baramidze on 29.08.22.
//

import Foundation

protocol ListPresenterProtocol: AnyObject {
    var router: ListRouter? { get set }
    var interactor: ListInteractorProtocol? { get set }
    var view: ListViewProtocol? { get set }
    
    func interactorDidfetchCountries(with result: Result<[Country], Error>)
    func showCountryDetail(_ country: Country)
}


class CountryListPresenter: ListPresenterProtocol {

    var router: ListRouter?
    
    var interactor: ListInteractorProtocol? {
        didSet {
            interactor?.getCountries()
        }
    }
    
    var view: ListViewProtocol?
    
    func showCountryDetail(_ country: Country) {
        guard let view = view else { return }
        router?.presentCountryDetailScreen(from: view, for: country)
    }
    
    func interactorDidfetchCountries(with result: Result<[Country], Error>) {
        switch result {
        case .success(let countries):
            view?.update(with: countries)
        case .failure(let error):
            view?.update(with: error.localizedDescription)
        }
    }
}
