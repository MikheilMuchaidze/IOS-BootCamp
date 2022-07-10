//
//  DetailsPage.swift
//  Muchaidze_Lecture_14
//
//  Created by Misha Muchaidze on 20220709...
//

import UIKit

class DetailsPage: UIViewController {

    @IBOutlet weak var userNameDetails: UILabel! 
    @IBOutlet weak var userEmailDetails: UILabel!
    
    @IBOutlet weak var blurView: UIView!
    @IBOutlet var popupView: UIView!
    
    var userNameFromRegistrationDetails = ""
    var userEmailFromRegistrationDetails = ""
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print(userNameFromRegistrationDetails)
        userNameDetails.text = userNameFromRegistrationDetails
        print(userEmailFromRegistrationDetails)
        userEmailDetails.text = userEmailFromRegistrationDetails
        
        //sets the size of the blur view to be equal to size of overall view
        blurView.bounds = self.view.bounds
        
        //set width = 90% of the screen, height = 40% of the screen
        popupView.bounds = CGRect(x: 0, y: 0, width: 240, height: 130)
    }
    
    //Pop-up actions are made with help of this video: https://www.youtube.com/watch?v=gLTDY8Qj6EM
    
    //animate in a specified view
    func animateIn(desiredView: UIView) {
        let backgroundView = self.view!
        
        //attach our desired view to the screen (self.view/backgroundView)
        backgroundView.addSubview(desiredView)
        
        //sets the view's scaling to be 120%
        desiredView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        desiredView.alpha = 0
        desiredView.center = backgroundView.center
        
        //animate the affect
        UIView.animate(withDuration: 0.3, animations: {
            desiredView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            desiredView.alpha = 1
        })
    }
    
    //animate out a specified view
    func animateOut(desiredView: UIView) {
        UIView.animate(withDuration: 0.3, animations: {
            desiredView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            desiredView.alpha = 0
        }, completion: { _ in
            desiredView.removeFromSuperview()
        })
    }
    
    //ratomgac bluris epeqti ar edeba ?????
    @IBAction func signOutAction(_ sender: Any) {
        animateIn(desiredView: blurView)
        animateIn(desiredView: popupView)
    }
    
    @IBAction func singOutNo(_ sender: Any) {
        animateOut(desiredView: popupView)
        animateOut(desiredView: blurView)
    }
    
    
    @IBAction func singOutYes(_ sender: Any) {
        let goToLoginPage = storyboard?.instantiateViewController(withIdentifier: "LoginPage") as? LoginPage
        self.navigationController?.pushViewController(goToLoginPage!, animated: true)
    }
    
}
