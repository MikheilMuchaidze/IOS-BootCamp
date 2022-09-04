//
//  TriangleDrawerVC.swift
//  Animations
//
//  Created by Vasili Baramidze on 02.09.22.
//

import UIKit

class TriangleDrawerVC: UIViewController {
    
    let imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 200),
            imageView.heightAnchor.constraint(equalToConstant: 200),
        ])
        view.backgroundColor = .systemGreen
        imageView.backgroundColor = .blue
        drawTriangle()
    }
    
    func drawTriangle() {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 200, height: 200))
        
        let image = renderer.image { con in
            let rect = CGRect(x: 0, y: 0, width: 100, height: 100)
            
            let context = con.cgContext
            context.beginPath()
            context.move(to: CGPoint(x: 0, y: 100))
            context.addLine(to: CGPoint(x: 0, y: 100))
            context.addLine(to: CGPoint(x: 100, y: 100))
            context.addLine(to: CGPoint(x: 0, y: 0))
            context.setStrokeColor(UIColor.red.cgColor)
            context.closePath()
            context.fillPath()
        }
        imageView.image = image
    }
}


