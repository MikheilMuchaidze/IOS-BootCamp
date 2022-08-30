//
//  InfoCell.swift
//  CleanSwift_Academy
//
//  Created by Giorgi Bostoghanashvili on 29.08.22.
//

import UIKit

final class InfoCell: UITableViewCell {
    
    // MARK: - Static Fields

    static var identifier: String { .init(describing: self) }
    
    // MARK: - Fields
    
    var allCountriesLabel = UILabel()
    var mostPopulationLabel: UILabel = {
        let view = UILabel()
        view.numberOfLines = 0
        
        return view
    }()
    
    // MARK: - ObjectLifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    func configure(with model: InfoCellModel) {
        allCountriesLabel.text = model.allCountries
        mostPopulationLabel.text = model.mostPopulated
    }
    
    // MARK: - PrivateMethods
    
    private func setup() {
        let stackView = UIStackView(arrangedSubviews: [allCountriesLabel, mostPopulationLabel])
        stackView.axis = .vertical
        
        addSubview(stackView)
        stackView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 12, paddingLeft: 12, paddingBottom: 12, paddingRight: 12)
        
        selectionStyle = .none
    }
}
