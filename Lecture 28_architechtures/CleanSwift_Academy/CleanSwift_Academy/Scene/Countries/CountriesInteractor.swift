//
//  CountriesInteractor.swift
//  CleanSwift_Academy
//
//  Created by Giorgi Bostoghanashvili on 28.08.22.
//

import UIKit

protocol CountriesBusinessLogic {
    func getCountries(request: Countries.GetCountries.Request)
    func didTapCountry(request: Countries.ShowCountryDetails.Request)
    func filterCountries(request: Countries.FilterCountries.Request)
}

protocol CountriesDataStore {
    var selectedCountry: Country? { get }
}

final class CountriesInteractor: CountriesDataStore {
    private let presenter: CountriesPresentationLogic
    private let worker: CountriesWorkerLogic
    
    var countries = [Country]()
    private(set) var selectedCountry: Country?
    
    // MARK: - Object Lifecycle
    
    init(presenter: CountriesPresentationLogic, worker: CountriesWorkerLogic) {
        self.presenter = presenter
        self.worker = worker
    }
}

// MARK: - CountriesBusinessLogic

extension CountriesInteractor: CountriesBusinessLogic {
    func filterCountries(request: Countries.FilterCountries.Request) {
        let keyword = request.keyword.lowercased()
        let filteredCountries = countries.filter { $0.name?.lowercased().hasPrefix(keyword) ?? false}
        presenter.presentFilteredCountries(response: Countries.FilterCountries.Response(data: filteredCountries))
    }
    
    func didTapCountry(request: Countries.ShowCountryDetails.Request) {
        self.selectedCountry = countries.first { $0.name == request.selectedCountryName}
        presenter.presentSelectedCountry(response: Countries.ShowCountryDetails.Response())
    }
    
    func getCountries(request: Countries.GetCountries.Request) {
        Task {
            do {
                let countries = try await worker.fetchCountries()
                DispatchQueue.main.async { [weak self] in
                    self?.countries = countries
                    self?.presenter.presentCountries(response: Countries.GetCountries.Response(data: countries))
                }
            } catch {
                // TODO: - Add Error handling
            }
        }
    }
}
