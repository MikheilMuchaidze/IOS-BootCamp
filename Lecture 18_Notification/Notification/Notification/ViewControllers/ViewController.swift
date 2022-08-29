//
//  ViewController.swift
//  Notification
//
//  Created by Vasili Baramidze on 18.07.22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var viewForGesture: UIView!
    let imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        imageView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
//        imageView.center = view.center
//        view.addSubview(imageView)
//
//        imageView.image = UIImage(named: "swipingAreas")!
//        imageView.isUserInteractionEnabled = true
        // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(self, selector: #selector(changeBackgroundColor), name: Notification.Name("com.TBCLecture.Notification.colorChange"), object: nil)
        
//        addTap()
//        addSwipe()
        addPinch()
        
    }
    
    func addPinch() {
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(pinched))
        viewForGesture.addGestureRecognizer(pinchGesture)
    }
    
    @objc func pinched(gesture: UIPinchGestureRecognizer) {
        print("zoom")
        gesture.view?.transform = (gesture.view?.transform.scaledBy(x: gesture.scale, y: gesture.scale))!
        print(gesture.scale)
        gesture.scale = 1
    }
    
    
    
    func addSwipe() {
        let rightSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipedOnView))
        rightSwipeGesture.direction = .right
        
        let leftSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipedOnView))
        leftSwipeGesture.direction = .left
        
        viewForGesture.addGestureRecognizer(rightSwipeGesture)
        viewForGesture.addGestureRecognizer(leftSwipeGesture)

    }
    
    @objc func swipedOnView(gesture: UISwipeGestureRecognizer) {
        switch gesture.direction {
        case .left:
            print("left")
        case .right:
            print("right")
        default:
           print("other")
        }
    }
    
    
    
    func addTap() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTappedUsingCode))
        viewForGesture.addGestureRecognizer(tapGesture)
    }
    
    @objc func viewTappedUsingCode() {
        print(#function)
    }
    
    
    
    
    
    @objc func changeBackgroundColor(notification: Notification) {
        if let color = notification.userInfo?["color"] as? UIColor {
            view.backgroundColor = color
        }
        
        if let number = notification.object as? Int {
            print(number)
        }
    }
}
