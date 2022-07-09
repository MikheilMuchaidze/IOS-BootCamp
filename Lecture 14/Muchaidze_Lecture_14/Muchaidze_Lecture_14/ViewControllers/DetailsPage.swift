//
//  DetailsPage.swift
//  Muchaidze_Lecture_14
//
//  Created by Misha Muchaidze on 20220709...
//

import UIKit

class DetailsPage: UIViewController {

    @IBOutlet weak var userNameDetails: UILabel!
    @IBOutlet weak var userEmailDetails: UILabel!
    
    var userNameFromRegistration = ""
    var userEmailFromRegistration = ""

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        userNameDetails.text = userNameFromRegistration
        userEmailDetails.text = userEmailFromRegistration
    }

}
