//
//  ViewController.swift
//  Constraints
//
//  Created by Vasili Baramidze on 20.07.22.
//

import UIKit

class ViewController: UIViewController {

    lazy var firstContainerView: UIView = {
        print("🌕")
        var firstContainerView = UIView()
        view.addSubview(firstContainerView)
        return firstContainerView
    }()

    lazy var secondView: UIView = {
        print("🔴")
        var secondView = UIView()
        view.addSubview(secondView)
        return secondView
    }()
    
//    let firstContainerView = UIView()
//    let secondView = UIView()
    lazy var bottomView1: UIView = {
        print("🌕")
        var bottomView1 = UIView()
        view.addSubview(bottomView1)
        return bottomView1
    }()
    
    lazy var bottomView2: UIView = {
        print("🌕")
        var bottomView2 = UIView()
        view.addSubview(bottomView2)
        return bottomView2
    }()
    
    lazy var bottomView3: UIView = {
        print("🌕")
        var bottomView3 = UIView()
        view.addSubview(bottomView3)
        return bottomView3
    }()
    
    let circleView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addSecondView()
        addFirstContainerView()
        addCircle()
        addBottomView1()
        addBottomView2()
        addBottomView3()
    }

    func addFirstContainerView(){
        firstContainerView.translatesAutoresizingMaskIntoConstraints = false
        firstContainerView.backgroundColor = .red
//        view.addSubview(firstContainerView)
        
        let leftConstraint = NSLayoutConstraint(item: firstContainerView,
                                                attribute: .left,
                                                relatedBy: .equal,
                                                toItem: view.layoutMarginsGuide,
                                                attribute: .left,
                                                multiplier: 1,
                                                constant: 0)
//
//        let rightConstraint = NSLayoutConstraint(item: firstContainerView,
//                                                attribute: .right,
//                                                relatedBy: .equal,
//                                                toItem: view,
//                                                attribute: .right,
//                                                multiplier: 1,
//                                                constant: -20)
        
        let top = NSLayoutConstraint(item: firstContainerView,
                                                attribute: .top,
                                                relatedBy: .equal,
                                     toItem: view.safeAreaLayoutGuide,
                                                attribute: .top,
                                                multiplier: 1,
                                                constant: 20)
        
        let width = NSLayoutConstraint(item: firstContainerView,
                                       attribute: .width,
                                       relatedBy: .equal,
                                       toItem: nil,
                                       attribute: .notAnAttribute,
                                       multiplier: 1,
                                       constant: 100)
        
        let height = NSLayoutConstraint(item: firstContainerView,
                                       attribute: .height,
                                       relatedBy: .equal,
                                       toItem: nil,
                                       attribute: .notAnAttribute,
                                       multiplier: 1,
                                       constant: 100)

        leftConstraint.isActive = true
        top.isActive = true
        width.isActive = true
        height.isActive = true
        print("🌕🌕")

    }

    func addSecondView() {
        secondView.translatesAutoresizingMaskIntoConstraints = false
        secondView.backgroundColor = .blue
        view.addSubview(secondView)
        
        let top = NSLayoutConstraint(item: secondView,
                                                attribute: .top,
                                                relatedBy: .equal,
                                     toItem: view.safeAreaLayoutGuide,
                                                attribute: .top,
                                                multiplier: 1,
                                                constant: 20)
        
        
        let left = NSLayoutConstraint(item: secondView,
                                      attribute: .left,
                                      relatedBy: .equal,
                                      toItem: firstContainerView,
                                      attribute: .right,
                                      multiplier: 1,
                                      constant: 20)
        
        let right = NSLayoutConstraint(item: secondView,
                                      attribute: .right,
                                      relatedBy: .equal,
                                      toItem: view,
                                      attribute: .right,
                                      multiplier: 1,
                                      constant: -20)
        
        
        let height = NSLayoutConstraint(item: secondView,
                                       attribute: .height,
                                       relatedBy: .equal,
                                       toItem: nil,
                                       attribute: .notAnAttribute,
                                       multiplier: 1,
                                        constant: 100)
        
        NSLayoutConstraint.activate([
            top,
            left,
            right,
            height
        ])
        print("🔴🔴")
    }
    
    func addCircle() {
        view.addSubview(circleView)
        let screenWidth = view.frame.width
        circleView.translatesAutoresizingMaskIntoConstraints = false
        circleView.backgroundColor = .green
        circleView.layer.cornerRadius = screenWidth/6
        circleView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
        circleView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        let width = NSLayoutConstraint(item: circleView,
                                       attribute: .width,
                                       relatedBy: .equal,
                                       toItem: nil,
                                       attribute: .notAnAttribute,
                                       multiplier: 1,
                                       constant: screenWidth/3).isActive = true
        
        let aspectRatio = NSLayoutConstraint(item: circleView,
                                             attribute: .height,
                                             relatedBy: .equal,
                                             toItem: circleView,
                                             attribute: .width,
                                             multiplier: 1,
                                             constant: 0).isActive = true
    }
    
    
    func addBottomView1() {
        bottomView1.translatesAutoresizingMaskIntoConstraints = false
        bottomView1.backgroundColor = .purple
        
        let left = NSLayoutConstraint(item: bottomView1,
                                      attribute: .left,
                                      relatedBy: .equal,
                                      toItem: view,
                                      attribute: .left,
                                      multiplier: 1,
                                      constant: 0).isActive = true
        
        let height = NSLayoutConstraint(item: bottomView1,
                                       attribute: .height,
                                       relatedBy: .equal,
                                       toItem: nil,
                                       attribute: .notAnAttribute,
                                       multiplier: 1,
                                        constant: 50).isActive = true
        
        let bottom = NSLayoutConstraint(item: bottomView1,
                                        attribute: .bottom,
                                        relatedBy: .equal,
                                        toItem: view,
                                        attribute: .bottom,
                                        multiplier: 1,
                                        constant: -50).isActive = true
    }
    
    func addBottomView2() {
        bottomView2.translatesAutoresizingMaskIntoConstraints = false
        bottomView2.backgroundColor = .blue.withAlphaComponent(0.5)
        
        
        let bottom = NSLayoutConstraint(item: bottomView2,
                                        attribute: .bottom,
                                        relatedBy: .equal,
                                        toItem: view,
                                        attribute: .bottom,
                                        multiplier: 1,
                                        constant: -50).isActive = true
        
        let left = NSLayoutConstraint(item: bottomView2,
                                      attribute: .left,
                                      relatedBy: .equal,
                                      toItem: bottomView1,
                                      attribute: .right,
                                      multiplier: 1,
                                      constant: 0).isActive = true
        
        let right = NSLayoutConstraint(item: bottomView2,
                                              attribute: .right,
                                              relatedBy: .equal,
                                              toItem: bottomView3,
                                              attribute: .left,
                                              multiplier: 1,
                                               constant: 0).isActive = true
        
        let height = NSLayoutConstraint(item: bottomView2,
                                       attribute: .height,
                                       relatedBy: .equal,
                                       toItem: nil,
                                       attribute: .notAnAttribute,
                                       multiplier: 1,
                                        constant: 50).isActive = true
        
        
    }
    
    func addBottomView3() {
        bottomView3.translatesAutoresizingMaskIntoConstraints = false
        bottomView3.backgroundColor = .blue
        
        
        let right = NSLayoutConstraint(item: bottomView3,
                                      attribute: .right,
                                      relatedBy: .equal,
                                      toItem: view,
                                      attribute: .right,
                                      multiplier: 1,
                                       constant: 0).isActive = true
        
        let left = NSLayoutConstraint(item: bottomView3,
                                      attribute: .left,
                                      relatedBy: .equal,
                                      toItem: bottomView2,
                                      attribute: .right,
                                      multiplier: 1,
                                       constant: 0).isActive = true
        
        let height = NSLayoutConstraint(item: bottomView3,
                                       attribute: .height,
                                       relatedBy: .equal,
                                       toItem: nil,
                                       attribute: .notAnAttribute,
                                       multiplier: 1,
                                        constant: 50).isActive = true
        
        
        let bottom = NSLayoutConstraint(item: bottomView3,
                                        attribute: .bottom,
                                        relatedBy: .equal,
                                        toItem: view,
                                        attribute: .bottom,
                                        multiplier: 1,
                                        constant: -50).isActive = true
        
        let equality1 = NSLayoutConstraint.init(item: bottomView1, attribute: .width, relatedBy: .equal, toItem: bottomView2, attribute: .width, multiplier: 1, constant: 0).isActive = true
        let equality2 = NSLayoutConstraint.init(item: bottomView2, attribute: .width, relatedBy: .equal, toItem: bottomView3, attribute: .width, multiplier: 1, constant: 0).isActive = true
        
    }
    
}


//#if canImport(swiftUI) && DEBUG
//import SwiftUI
//struct PreviewViewController_Previews: PreviewProvider {
//    static var previews: some View {
//        ViewControllerPreview {
//            ViewController()
//        }.previewDevice("iPhone 12")
//    }
//}
//
//struct ViewControllerPreview<ViewController: UIViewController>: UIViewControllerRepresentable {
//    let viewControllerBuilder: () -> UIViewController
//
//    init(_ viewControllerBuilder: @escaping () -> UIViewController) {
//        self.viewControllerBuilder = viewControllerBuilder
//    }
//
//    func makeUIViewController(context: Context) -> some UIViewController {
//        return viewControllerBuilder()
//    }
//
//    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
//    }
//}
//#endif



