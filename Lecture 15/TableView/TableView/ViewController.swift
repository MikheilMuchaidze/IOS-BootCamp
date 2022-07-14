//
//  ViewController.swift
//  TableView
//
//  Created by Vasili Baramidze on 11.07.22.
//

import UIKit

class ViewController: UIViewController {

    var countries = [Country]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

    }

    @IBAction func addCountry(_ sender: Any) {
        if Country.countries.count > countries.count {
            countries.append(Country.countries[countries.count])
            countries.forEach({ country in
                print(country.flag)
            })
        }
    }
}


