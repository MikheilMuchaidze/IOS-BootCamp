//
//  CountriesDataSource.swift
//  testProj
//
//  Created by Marika Kalandia on 29.08.22.
//

import UIKit

class CountriesDataSource: NSObject {
    
    // MARK: Private properties
    
    private var tableView: UITableView
    private var viewModel: CountriesListViewModelProtocol
    private var countriesList: [CountryViewModel] = []
    
    init(tableView: UITableView, viewModel: CountriesListViewModelProtocol) {
        self.tableView = tableView
        self.viewModel = viewModel
        super.init()
        setUpDelegates()
    }
    
    private func setUpDelegates() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    func refresh() {
        viewModel.getCountriesList(completion: { countries in
            self.countriesList.append(contentsOf: countries)
            self.tableView.reloadData()
        })
    }
}

extension CountriesDataSource: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        countriesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let country = countriesList[indexPath.row]
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "CountryTableCell", for: indexPath) as? CountryTableCell
        else {
            fatalError("Cannot deque cell with identifier: CountryTableCell")
        }
        cell.configure(with: country)
        return cell
    }
}

extension CountriesDataSource: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}
