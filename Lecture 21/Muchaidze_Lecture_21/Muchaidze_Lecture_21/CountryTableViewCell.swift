//
//  CountryTableViewCell.swift
//  Muchaidze_Lecture_21
//
//  Created by Misha Muchaidze on 20220811...
//

import UIKit

class CountryTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var countryName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
