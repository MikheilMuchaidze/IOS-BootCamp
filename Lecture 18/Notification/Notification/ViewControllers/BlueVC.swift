//
//  BlueVC.swift
//  Notification
//
//  Created by Vasili Baramidze on 18.07.22.
//

import UIKit

class BlueVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func changeColoAction(_ sender: Any) {
        let information = ["color": UIColor.red]

        NotificationCenter.default.post(name: Notification.Name("com.TBCLecture.Notification.colorChange"), object: 5, userInfo: information)
    }
}
