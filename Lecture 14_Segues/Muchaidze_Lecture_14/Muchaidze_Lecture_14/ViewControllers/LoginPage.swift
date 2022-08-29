//
//  LoginPage.swift
//  Muchaidze_Lecture_14
//
//  Created by Misha Muchaidze on 20220709...
//

import UIKit

class LoginPage: UIViewController {
    
    @IBOutlet weak var userNameLogin: UITextField!
    @IBOutlet weak var userPassworLogin: UITextField!
    
    var userNameFromRegistration = ""
    var userPasswordFromRegistration = ""
    var userEmailFromRegistration = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print(userNameFromRegistration)
        print(userPasswordFromRegistration)
    }
    
    @IBAction func signInGoToDetails(_ sender: Any) {
        if (userNameLogin.text == "" || userPassworLogin.text == "") {
            let alertMessage = UIAlertController(title: "Empty field", message: "Username or password field is empty, please input data", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "Try again", style: UIAlertAction.Style.default, handler: nil)
            alertMessage.addAction(okAction)
            self.present(alertMessage, animated: true)
        }
        if (userNameLogin.text == userNameFromRegistration && userPassworLogin.text == userPasswordFromRegistration) {
            dataGoToDetailsPage()
        } else {
            let alertMessage = UIAlertController(title: "Doesn't match", message: "Username and password doesn't match with registered data", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "Try again", style: UIAlertAction.Style.default, handler: nil)
            alertMessage.addAction(okAction)
            self.present(alertMessage, animated: true)
            return
        }
    }
    
    func dataGoToDetailsPage() {
        let goToDetailsPage = storyboard?.instantiateViewController(withIdentifier: "DetailsPage") as? DetailsPage
        goToDetailsPage?.userNameFromRegistrationDetails = userNameFromRegistration
        goToDetailsPage?.userEmailFromRegistrationDetails = userEmailFromRegistration
        self.navigationController?.pushViewController(goToDetailsPage!, animated: true)
    }

}

