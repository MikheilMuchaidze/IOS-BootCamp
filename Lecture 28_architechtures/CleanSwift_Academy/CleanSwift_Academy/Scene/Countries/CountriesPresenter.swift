//
//  CountriesPresenter.swift
//  CleanSwift_Academy
//
//  Created by Giorgi Bostoghanashvili on 28.08.22.
//

import UIKit

protocol CountriesPresentationLogic {
    func presentCountries(response: Countries.GetCountries.Response)
    func presentSelectedCountry(response: Countries.ShowCountryDetails.Response)
    func presentFilteredCountries(response: Countries.FilterCountries.Response)
}

final class CountriesPresenter {
    // MARK: - Clean Components
    
    weak var viewController: CountriesDisplayLogic?
    
    // MARK: - Private Methods
    
    private func configureTableModel(from data: [Country]) -> [AbstractModel] {
        var tableModel = [AbstractModel]()
        let mostPopulated = data.sorted(by: { $0.population ?? .zero > $1.population ?? .zero }).first?.name ?? ""
        
        tableModel.append(
            InfoCellModel(
                allCountries: "\(data.count)",
                mostPopulated: "\(mostPopulated)"
            )
        )
        
        tableModel.append(contentsOf: data.map { CountryCellModel(title: $0.name ?? "no name provided") })
        
        return tableModel
    }
}

// MARK: - CountriesPresentationLogic

extension CountriesPresenter: CountriesPresentationLogic {
    func presentSelectedCountry(response: Countries.ShowCountryDetails.Response) {
        viewController?.displaySelectedCountry(viewModel: Countries.ShowCountryDetails.ViewModel())
    }
    
    func presentCountries(response: Countries.GetCountries.Response) {
        let viewModel = configureTableModel(from: response.data)
        viewController?.displayCountries(viewModel: Countries.GetCountries.ViewModel(tableData: viewModel))
    }
    
    func presentFilteredCountries(response: Countries.FilterCountries.Response) {
        let viewModel = configureTableModel(from: response.data)
        viewController?.displayFilteredCountry(viewModel: Countries.FilterCountries.ViewModel(tableData: viewModel))
    }
}
