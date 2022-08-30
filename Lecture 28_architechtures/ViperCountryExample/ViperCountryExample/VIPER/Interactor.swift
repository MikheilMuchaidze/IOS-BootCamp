//
//  Interactor.swift
//  ViperCountryExample
//
//  Created by Vasili Baramidze on 29.08.22.
//

import Foundation

protocol ListInteractorProtocol {
    
    var presenter: ListPresenterProtocol? { get set }
    
    func getCountries()
}

class CountryListIteractor: ListInteractorProtocol {
    var presenter: ListPresenterProtocol?
    
    func getCountries() {
        DataFetcher.shared.fetch(with: CountryUrlBuilder.shared.urlString, as: [Country].self) { [weak self] data in
            self?.presenter?.interactorDidfetchCountries(with: .success(data))
        } onError: { [weak self] error in
            self?.presenter?.interactorDidfetchCountries(with: .failure(error))
        }
    }
}
