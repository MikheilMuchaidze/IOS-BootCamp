//
//  ViewAnimationsVC.swift
//  Animations
//
//  Created by Vasili Baramidze on 02.09.22.
//

import UIKit

class ViewAnimationsVC: UIViewController {

    let viewForAnimation = UIView()
    let button = myButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewForAnimation.frame = CGRect(x: 150, y: 200, width: 100, height: 50)
        
        viewForAnimation.backgroundColor = .orange
        
        button.addTarget(self, action: #selector(playAnimation(_:)), for: .primaryActionTriggered)
        
        view.addSubview(viewForAnimation)
        view.addSubview(button)
    }
    
    @objc func playAnimation(_ sender: UIButton) {
        UIView.animate(withDuration: 2) {
            self.viewForAnimation.transform = CGAffineTransform(scaleX: 1.2, y: 1.5)
        } completion: { _ in
            UIView.animate(withDuration: 2) { [weak self] in
                self?.viewForAnimation.transform = .identity
            } completion: { _ in
                UIView.animate(withDuration: 2) {
                    self.viewForAnimation.alpha = 0.5
                }
            }
        }
    }
}
