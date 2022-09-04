//
//  ViewController.swift
//  Animations
//
//  Created by Vasili Baramidze on 02.09.22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var myViewLeading: NSLayoutConstraint!
    
    let button = myButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button.addTarget(self, action: #selector(playAnimation(_:)), for: .primaryActionTriggered)
        
        view.addSubview(button)
    }
    
    @objc func playAnimation(_ sender: UIButton) {
//        myViewTopConstraint.constant = 300
//        myViewLeading.constant = 100
//        UIView.animate(withDuration: 2) {
//            self.view.layoutIfNeeded()
//        }
        
//        UIView.animate(withDuration: 2) {
//            self.view.layoutIfNeeded()
//        } completion: { _ in
//            self.myViewLeading.constant = 100
//            UIView.animate(withDuration: 2) {
//                self.view.layoutIfNeeded()
//            }
//        }
        
        UIView.animate(withDuration: 2, delay: 2, options: []) {
            self.view.layoutIfNeeded()
        } completion: { _ in
            self.myViewLeading.constant = 100
            UIView.animate(withDuration: 2) {
                self.view.layoutIfNeeded()
            }
        }
    }
}
