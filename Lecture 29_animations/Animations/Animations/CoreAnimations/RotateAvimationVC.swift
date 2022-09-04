//
//  RotateAvimationVC.swift
//  Animations
//
//  Created by Vasili Baramidze on 02.09.22.
//

import UIKit

class RotateAvimationVC: UIViewController {

    let viewForRotation = UIView(frame: CGRect(x: 20, y: 100, width: 100, height: 50))

    let button = myButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewForRotation.backgroundColor = .systemGreen
        
        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .primaryActionTriggered)
        
        view.addSubview(viewForRotation)
        view.addSubview(button)
    }//
    

    @objc func buttonTapped(_ sender: UIButton) {
        
    }
}
