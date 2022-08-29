//
//  GreenVC.swift
//  Notification
//
//  Created by Vasili Baramidze on 18.07.22.
//

import UIKit

class GreenVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(self, selector: #selector(changeBackgroundColor), name: Notification.Name("com.TBCLecture.Notification.colorChange"), object: nil)
    }
    
    @objc func changeBackgroundColor() {
        view.backgroundColor = .green
    }

}
