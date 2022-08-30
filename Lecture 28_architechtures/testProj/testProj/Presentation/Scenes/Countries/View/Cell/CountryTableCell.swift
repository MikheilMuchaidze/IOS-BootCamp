//
//  CountryTableCell.swift
//  testProj
//
//  Created by Marika Kalandia on 29.08.22.
//

import UIKit

class CountryTableCell: UITableViewCell {
    @IBOutlet weak var capitalLabel: UILabel!
    @IBOutlet weak var regionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with item: CountryViewModel) {
        capitalLabel.text = item.capital
        regionLabel.text = item.region
    }
}
