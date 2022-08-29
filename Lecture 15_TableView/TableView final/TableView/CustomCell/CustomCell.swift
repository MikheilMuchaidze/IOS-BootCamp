//
//  CustomCell.swift
//  TableView
//
//  Created by Vasili Baramidze on 11.07.22.
//

import UIKit

class CustomCell: UITableViewCell {
    
    @IBOutlet weak var counrtyInformationLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    
}
