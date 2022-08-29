//
//  CountryCell.swift
//  TableView
//
//  Created by Vasili Baramidze on 11.07.22.
//

import UIKit

protocol CountryCellDelegate {
    func addPopulation(cell: CountryCell)
    func minusPopulation(cell: CountryCell)
}

class CountryCell: UITableViewCell {
    
    static let identifier = "\(CountryCell.Type.self)"
    
    @IBOutlet weak var flagLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var populationLbl: UILabel!
    
    var delegate: CountryCellDelegate!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func minusPopulation(_ sender: Any) {
        delegate.minusPopulation(cell: self)
    }
    
    
    @IBAction func addPopulation(_ sender: Any) {
        delegate.addPopulation(cell: self)
    }
}
