//
//  InteractorOfDetail.swift
//  ViperCountryExample
//
//  Created by Vasili Baramidze on 29.08.22.
//

import Foundation


protocol CountryDetailInteractorInputProtocol: AnyObject {
    
    var presenter: CountryDetailInteractorOutputProtocol? { get set }
    var countryItem: Country? { get set }
}

protocol CountryDetailInteractorOutputProtocol: AnyObject {
    
}


class CountryDetailInteractor: CountryDetailInteractorInputProtocol {
    
    weak var presenter: CountryDetailInteractorOutputProtocol?
    var countryItem: Country?

    
}
