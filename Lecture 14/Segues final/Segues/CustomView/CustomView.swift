//
//  CustomView.swift
//  Segues
//
//  Created by Vasili Baramidze on 08.07.22.
//

import UIKit

protocol CustomViewDelegate {
    func showAlert(with title: String)
}

class CustomView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    var delegate: CustomViewDelegate!
    var someAction: ((String)->())?
    
    @IBAction func makeSomething(_ sender: Any) {
        someAction?("\(CustomView.self)")
//        delegate.showAlert(with: "\(CustomView.self)")
    }
    
}
