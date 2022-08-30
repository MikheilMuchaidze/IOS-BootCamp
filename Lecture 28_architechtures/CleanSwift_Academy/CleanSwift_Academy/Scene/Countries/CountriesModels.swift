//
//  CountriesModels.swift
//  CleanSwift_Academy
//
//  Created by Giorgi Bostoghanashvili on 28.08.22.
//

import Foundation

import UIKit

enum Countries {
    // MARK: Use cases
    
    enum GetCountries {
        struct Request { }
        
        struct Response {
            let data: [Country]
        }
        
        struct ViewModel {
            let tableData: [AbstractModel]
        }
    }
    
    enum ShowCountryDetails {
        struct Request {
            let selectedCountryName: String
        }
        
        struct Response { }
        
        struct ViewModel { }
    }
    
    enum FilterCountries {
        struct Request {
            let keyword: String
        }
        
        struct Response {
            let data: [Country]
        }
        
        struct ViewModel {
            let tableData: [AbstractModel]
        }
    }
}
