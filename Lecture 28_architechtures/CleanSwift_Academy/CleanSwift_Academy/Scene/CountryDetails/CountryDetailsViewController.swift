//
//  CountryDetailsViewController.swift
//  CleanSwift_Academy
//
//  Created by Giorgi Bostoghanashvili on 28.08.22.
//


import UIKit

protocol CountryDetailsDisplayLogic: AnyObject {
    func displaySelectedCountry(viewModel: CountryDetails.ShowCountryDetails.ViewModel)
}

final class CountryDetailsViewController: UIViewController {
    // MARK: - Clean Components
    
    private let interactor: CountryDetailsBusinessLogic
    private let router: CountryDetailsRoutingLogic & CountryDetailsDataPassing
    
    // MARK: - View
    
    private let populationLabel: UILabel = {
        let view = UILabel()
        view.numberOfLines = 0
        return view
    }()
    
    private let capitalLabel: UILabel = {
        let view = UILabel()
        view.numberOfLines = 0
        return view
    }()
    // MARK: - Object lifecycle
    
    init(interactor: CountryDetailsBusinessLogic, router: CountryDetailsRoutingLogic & CountryDetailsDataPassing) {
        self.interactor = interactor
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        interactor.getCountry(request: CountryDetails.ShowCountryDetails.Request())
    }
    
    // MARK: - Private Methods
    
    private func setupView() {
        view.backgroundColor = .white
        let stackView = UIStackView(arrangedSubviews: [populationLabel, capitalLabel])
        stackView.axis = .vertical
        view.addSubview(stackView)
        stackView.anchor(left: view.leftAnchor, right: view.rightAnchor, paddingLeft: 12, paddingRight: 12)
        stackView.center(inView: view)
    }
}

// MARK: - CountryDetailsDisplayLogic

extension CountryDetailsViewController: CountryDetailsDisplayLogic {
    func displaySelectedCountry(viewModel: CountryDetails.ShowCountryDetails.ViewModel) {
        populationLabel.text = viewModel.population
        capitalLabel.text = viewModel.capital
    }
}
