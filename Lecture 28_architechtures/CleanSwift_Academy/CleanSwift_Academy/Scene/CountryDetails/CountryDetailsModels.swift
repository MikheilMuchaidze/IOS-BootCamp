//
//  CountryDetailsModels.swift
//  CleanSwift_Academy
//
//  Created by Giorgi Bostoghanashvili on 28.08.22.
//


import UIKit

enum CountryDetails {
    // MARK: Use cases
    
    enum ShowCountryDetails {
        struct Request { }
        
        struct Response {
            let country: Country
        }
        
        struct ViewModel {
            let population: String
            let capital: String
        }
    }
}
