//
//  ViewController.swift
//  TableView
//
//  Created by Vasili Baramidze on 11.07.22.
//

import UIKit

class ViewController: UIViewController, CountryCellDelegate {
    func addPopulation(cell: CountryCell) {
        
        if let indexPath = countriesTableView.indexPath(for: cell) {
            print(indexPath,"add")
            var country = countries[indexPath.row]
            country.population += 10005
            countriesTableView.reloadData()
        }
    }
    
    func minusPopulation(cell: CountryCell) {
        
        if let indexPath = countriesTableView.indexPath(for: cell) {
            print(indexPath,"minus")
        }
    }
    


    @IBOutlet weak var countriesTableView: UITableView!
    
    var countries = [Country]()
    var numbers = [1,2,3,4,5,6]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        countriesTableView.delegate = self
        countriesTableView.dataSource = self
        countriesTableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "CustomCell")
    }

    @IBAction func addCountry(_ sender: Any) {
        
        if Country.countries.count > countries.count {
            countries.append(Country.countries[countries.count])
            countries.forEach({ country in
                print(country.flag)
            })
            print("----------")
            countriesTableView.reloadData()
        }
    }
}

 
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return numbers.count
        } else {
            return countries.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell
            cell.counrtyInformationLbl.text = "\(numbers[indexPath.row])"
            return cell
        } else {
            let currentCounrty = countries[indexPath.row]

            if currentCounrty.population > 40_000_000 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell
                cell.counrtyInformationLbl.text = "name: \(currentCounrty.name), pop: \(currentCounrty.population), flag: \(currentCounrty.flag)"
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath) as! CountryCell
                cell.flagLbl.text = currentCounrty.flag
                cell.descriptionLbl.text = currentCounrty.name
                cell.populationLbl.text = "\(currentCounrty.population)"
                cell.delegate = self
                return cell
            }
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let viewForHeader = UIView()
        if section == 0 {
            viewForHeader.backgroundColor = .green
        } else {
            viewForHeader.backgroundColor = .red
        }
        return viewForHeader
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            print("number clicked")
        } else {
            print("country clicked")
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        72
    }
}

