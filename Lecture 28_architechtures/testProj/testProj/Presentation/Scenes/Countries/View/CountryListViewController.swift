//
//  CountryListViewController.swift
//  testProj
//
//  Created by Marika Kalandia on 29.08.22.
//

import UIKit

class CountryListViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Private properties
    private var viewModel: CountriesListViewModelProtocol!
    private var dataSource: CountriesDataSource!
    private var countriesManager: CountriesManagerProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpLayout()
        configureViewModel()
        
    }

    private func setUpLayout() {
        tableView.register(
            UINib(nibName: "CountryTableCell", bundle: nil),
            forCellReuseIdentifier: "CountryTableCell")
    }
    
    private func configureViewModel() {
        countriesManager = CountriesManager()
        viewModel = CountriesListViewModel(with: countriesManager)
        dataSource = CountriesDataSource(tableView: tableView, viewModel: viewModel)
    }

    @IBAction func fetchButtonDidTap(_ sender: Any) {
        dataSource.refresh()
    }
    
}

