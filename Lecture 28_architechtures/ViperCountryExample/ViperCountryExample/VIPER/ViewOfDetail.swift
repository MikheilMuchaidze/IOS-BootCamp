//
//  ViewOfDetail.swift
//  ViperCountryExample
//
//  Created by Vasili Baramidze on 29.08.22.
//

import UIKit

protocol CountryDetailViewProtocol: AnyObject {
    
    var presenter: CountryDetailPresenterProtocol? { get set }
    
    func showCountry(_ country: Country)
}

class CountryDetailViewController: UIViewController {
    
    private let infoLbl: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()

    var presenter: CountryDetailPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        infoLbl.backgroundColor = .yellow
        view.addSubview(infoLbl)
        presenter?.viewDidLoad()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        infoLbl.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        infoLbl.center = view.center
    }
}

extension CountryDetailViewController: CountryDetailViewProtocol {
    
    func showCountry(_ country: Country) {
        infoLbl.text = country.name
    }
}
