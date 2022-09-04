//
//  RectDrawerVC.swift
//  Animations
//
//  Created by Vasili Baramidze on 02.09.22.
//


import UIKit

class RectDrawerVC: UIViewController {
    
    let myviewForDrawing = MyView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray5
        
        myviewForDrawing.translatesAutoresizingMaskIntoConstraints = false
                
        view.addSubview(myviewForDrawing)
        
        NSLayoutConstraint.activate([
            myviewForDrawing.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            myviewForDrawing.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            myviewForDrawing.widthAnchor.constraint(equalToConstant: 200),
            myviewForDrawing.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
}

class MyView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {

        let context = UIGraphicsGetCurrentContext()!
        //MARK: - triangle
        context.beginPath()
//        context.move(to: CGPoint(x: 0, y: 100))
//        context.addLine(to: CGPoint(x: 0, y: 100))
//        context.addLine(to: CGPoint(x: 100, y: 100))
//        context.addLine(to: CGPoint(x: 0, y: 0))
        context.setFillColor(UIColor.green.cgColor)
//        context.closePath()
//        context.fillPath()
        
        //MARK: - rectangle
        let rectangleFrame = CGRect(x: 0, y: 0, width: 200, height: 100)
        context.addRect(rectangleFrame)
//        context.addEllipse(in: rectangleFrame)
        context.setLineWidth(10)
        context.fillPath()
        
    }
}


