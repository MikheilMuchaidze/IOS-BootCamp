//
//  CountryCell.swift
//  CollectionView
//
//  Created by Vasili Baramidze on 13.07.22.
//

import UIKit

class CountryCell: UICollectionViewCell {

    @IBOutlet weak var flagImageView: UIImageView!
    @IBOutlet weak var countryName: UILabel!
    @IBOutlet weak var populationLbl: UILabel!
    
    var country: Country! {
        didSet {
            countryName.text = country.name
            populationLbl.text = "\(country.population)"
            flagImageView.image = country.flag
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        loadCellDesign()
    }
    
    func loadCellDesign() {
        print("🌕")
        flagImageView.layer.cornerRadius = 5
        flagImageView.layer.borderColor = UIColor.white.cgColor
        flagImageView.layer.borderWidth = 2
    }
}
