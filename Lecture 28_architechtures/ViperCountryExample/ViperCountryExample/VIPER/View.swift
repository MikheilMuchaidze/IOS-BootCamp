//
//  View.swift
//  ViperCountryExample
//
//  Created by Vasili Baramidze on 29.08.22.
//

import Foundation
import UIKit

protocol ListViewProtocol {
    
    var presenter: ListPresenterProtocol? { get set }
    
    func update(with countries: [Country])
    func update(with error: String)
}

class CountryListViewController: UIViewController, ListViewProtocol, UITableViewDataSource,UITableViewDelegate {

    var presenter: ListPresenterProtocol?
    
    private let countriesTableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "countryCell")
        return table
    }()
    
    var countries: [Country] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(countriesTableView)
        view.backgroundColor = .red
        countriesTableView.backgroundColor = .blue
        countriesTableView.dataSource = self
        countriesTableView.delegate = self
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        countriesTableView.frame = view.bounds
    }
    
    func update(with countries: [Country]) {
        DispatchQueue.main.async {
            self.countries = countries
            self.countriesTableView.reloadData()
        }
    }
    
    func update(with error: String) {
        DispatchQueue.main.async {
            self.countries = []
            self.countriesTableView.reloadData()
            let alert = UIAlertController(title: "შეცდომა", message: error, preferredStyle: .alert)
            let action = UIAlertAction(title: "კარგი", style: .default, handler: nil)
            alert.addAction(action)
            
            self.present(alert, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let country = countries[indexPath.row]
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "countryCell")
        cell.textLabel?.text = "\(country.name)"
        cell.detailTextLabel?.text = "capital: \(String(describing: country.capital ?? "🚫"))"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let country = countries[indexPath.row]
        presenter?.showCountryDetail(country)
    }
}
