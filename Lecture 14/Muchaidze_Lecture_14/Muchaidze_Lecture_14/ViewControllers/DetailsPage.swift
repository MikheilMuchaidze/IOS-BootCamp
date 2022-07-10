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
    
    var userNameFromRegistrationDetails = ""
    var userEmailFromRegistrationDetails = ""
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print(userNameFromRegistrationDetails)
        userNameDetails.text = userNameFromRegistrationDetails
        print(userEmailFromRegistrationDetails)
        userEmailDetails.text = userEmailFromRegistrationDetails
    }
        
    @IBAction func signOutButton(_ sender: Any) {
        let popup = BottomSheetPage()
        view.addSubview(popup)
    }
}
