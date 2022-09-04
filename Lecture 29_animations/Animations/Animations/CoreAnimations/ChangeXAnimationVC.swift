//
//  ChangeXAnimationVC.swift
//  Animations
//
//  Created by Vasili Baramidze on 02.09.22.
//

import UIKit

class ChangeXAnimationVC: UIViewController {

    let movingView = UIView(frame: CGRect(x: 20, y: 100, width: 100, height: 50))
    let button = myButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        movingView.backgroundColor = .systemOrange
        
        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .primaryActionTriggered)
        
        view.addSubview(movingView)
        view.addSubview(button)
    }

    @objc func buttonTapped(_ sender: UIButton) {
        let animation = CABasicAnimation()
        animation.keyPath = "position.x"
        animation.fromValue = 20+50
        animation.toValue = 300
        animation.duration = 2
        
        movingView.layer.add(animation, forKey: "basic")
        movingView.layer.position = CGPoint(x: 300, y: 100)
    }
}

