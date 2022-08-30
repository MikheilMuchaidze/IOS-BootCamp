//
//  InfoCellModel.swift
//  CleanSwift_Academy
//
//  Created by Giorgi Bostoghanashvili on 29.08.22.
//

import Foundation

final class InfoCellModel: AbstractModel {
    let allCountries: String
    let mostPopulated: String
    
    init(allCountries: String, mostPopulated: String) {
        self.allCountries = "Total Number of Countries are: -" + allCountries
        self.mostPopulated = "most populated country is: - " + mostPopulated
    }
}
