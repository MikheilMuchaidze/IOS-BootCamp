//
//  CountriesViewController.swift
//  CleanSwift_Academy
//
//  Created by Giorgi Bostoghanashvili on 28.08.22.
//

import UIKit

protocol CountriesDisplayLogic: AnyObject {
    func displayCountries(viewModel: Countries.GetCountries.ViewModel)
    func displaySelectedCountry(viewModel: Countries.ShowCountryDetails.ViewModel)
    func displayFilteredCountry(viewModel: Countries.FilterCountries.ViewModel)
}

final class CountriesViewController: UIViewController {
    // MARK: - Clean Components
    
    private let interactor: CountriesBusinessLogic
    private let router: CountriesRoutingLogic & CountriesDataPassing
    
    // MARK: - View
    
    private lazy var tableView: UITableView = {
        let view = UITableView()
        view.delegate = self
        view.dataSource = self
        return view
    }()
    
    // MARK: - Fields
    
    private var dataSource = [AbstractModel]()
    
    // MARK: Object lifecycle
    
    init(interactor: CountriesBusinessLogic, router: CountriesRoutingLogic & CountriesDataPassing) {
        self.interactor = interactor
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor.getCountries(request: Countries.GetCountries.Request())
        setupView()
        setupSearchBar()
    }
    
    // MARK: - Private Methods
    
    private func setupView() {
        tableView.register(InfoCell.self, forCellReuseIdentifier: InfoCell.identifier)
        tableView.register(CountryCell.self, forCellReuseIdentifier: CountryCell.identifier)
        view.addSubview(tableView)
        tableView.fillSuperview()
    }
    
    private func setupSearchBar() {
        let searchController = UISearchController()
        searchController.searchBar.returnKeyType = .search
        searchController.searchBar.placeholder = "Search.."
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
    }
    
    private func setTableData(data: [AbstractModel]) {
        self.dataSource = data
        tableView.reloadData()
    }
}

// MARK: - CountriesDisplayLogic

extension CountriesViewController: CountriesDisplayLogic {
    func displayFilteredCountry(viewModel: Countries.FilterCountries.ViewModel) {
        setTableData(data: viewModel.tableData)
    }
    
    func displaySelectedCountry(viewModel: Countries.ShowCountryDetails.ViewModel) {
        router.navigateToCountryDetails()
    }
    
    func displayCountries(viewModel: Countries.GetCountries.ViewModel) {
        setTableData(data: viewModel.tableData)
    }
}

// MARK: - UITableViewDataSource

extension CountriesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = dataSource[indexPath.row]
        
        if let model = model as? InfoCellModel {
            let cell = tableView.dequeueReusableCell(withIdentifier: InfoCell.identifier) as! InfoCell
            cell.configure(with: model)
            return cell
        }
        
        if let model = model as? CountryCellModel {
            let cell = tableView.dequeueReusableCell(withIdentifier: CountryCell.identifier) as! CountryCell
            cell.configure(with: model)
            return cell
        }
        
        return .init()
    }
}

// MARK: - UITableViewDelegate

extension CountriesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let model = dataSource[indexPath.row] as? CountryCellModel else { return }
        interactor.didTapCountry(request: Countries.ShowCountryDetails.Request(selectedCountryName: model.title))
    }
}

// MARK: - UISearchResultsUpdating

extension CountriesViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        interactor.filterCountries(request: Countries.FilterCountries.Request(keyword: text))
    }
}
