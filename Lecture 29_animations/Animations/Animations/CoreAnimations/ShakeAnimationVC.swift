//
//  ShakeAnimationVC.swift
//  Animations
//
//  Created by Vasili Baramidze on 02.09.22.
//

import UIKit

class ShakeAnimationVC: UIViewController {
    
    let viewForshake = UIView()
    let button = myButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewForshake.frame = CGRect(x: 150, y: 200, width: 100, height: 50)
        viewForshake.backgroundColor = .orange
        
        button.addTarget(self, action: #selector(shakeTapped(_:)), for: .primaryActionTriggered)
        button.tintColor = .red
        
        view.addSubview(viewForshake)
        view.addSubview(button)
    }
    
    @objc func shakeTapped(_ sender: UIButton) {
        let animation = CAKeyframeAnimation()
        animation.keyPath = "position.x"
        animation.values = [20,-20,10,-10,5,-5,0]
        animation.keyTimes = [0.15,0.30,0.45,0.60,0.75,1]
        animation.duration = 3
        
        viewForshake.layer.add(animation, forKey: "basic")
    }
}
