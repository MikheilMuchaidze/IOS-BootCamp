//
//  PresenterOfDetail.swift
//  ViperCountryExample
//
//  Created by Vasili Baramidze on 29.08.22.
//

import UIKit

protocol CountryDetailPresenterProtocol: AnyObject {
    
    var view: CountryDetailViewProtocol? { get set }
    var interactor: CountryDetailInteractorInputProtocol? { get set }
    var router: CountryDetailRouterProtocol? { get set }
    
    func viewDidLoad()
}

class CountryDetailPresenter: CountryDetailPresenterProtocol {

    weak var view: CountryDetailViewProtocol?
    var router: CountryDetailRouterProtocol?
    var interactor: CountryDetailInteractorInputProtocol?
    
    
    func viewDidLoad() {
        if let countryItem = interactor?.countryItem {
            view?.showCountry(countryItem)
        }
    }
}

extension CountryDetailPresenter: CountryDetailInteractorOutputProtocol { }
