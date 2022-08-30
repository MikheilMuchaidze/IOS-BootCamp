//
//  CountriesWorker.swift
//  CleanSwift_Academy
//
//  Created by Giorgi Bostoghanashvili on 28.08.22.
//

import UIKit

protocol CountriesWorkerLogic {
    func fetchCountries() async throws -> [Country]
}

final class CountriesWorker: CountriesWorkerLogic {
    // MARK: - Fields
    
    private var api: APIManager
    private let urlString = "https://restcountries.com/v2/all"
    
    init(apiManager: APIManager) {
        self.api = apiManager
    }
    
    // MARK: - Methods
    
    func fetchCountries() async throws -> [Country] {
        try await api.fetchData(urlString: urlString, decodingType: [Country].self)
    }
}
