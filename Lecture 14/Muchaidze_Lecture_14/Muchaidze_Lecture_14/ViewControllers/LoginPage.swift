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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print(userNameFromRegistration)
        print(userPasswordFromRegistration)
    }
    
    @IBAction func signInGoToDetails(_ sender: Any) {
        if (userNameFromRegistration == userNameLogin.text && userPasswordFromRegistration == userPassworLogin.text) {
            let goToDetailsPage = storyboard?.instantiateViewController(withIdentifier: "DetailsPage") as? DetailsPage
            self.navigationController?.pushViewController(goToDetailsPage!, animated: true)
        } else {
            let alertMessage = UIAlertController(title: "Doesn't match", message: "Username and password doesn't match with registered data", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "Try again", style: UIAlertAction.Style.default, handler: nil)
            alertMessage.addAction(okAction)
            self.present(alertMessage, animated: true)
            return
        }
        dataGoToDetailsPage()
    }
    
    func dataGoToDetailsPage() {
        guard let registeredUserName = userNameLogin.text else { return }
        let goToDetailsPage = storyboard?.instantiateViewController(withIdentifier: "DetailsPage") as? DetailsPage
        goToDetailsPage?.userNameDetails.text = registeredUserName
        
        let fromRegPage = storyboard?.instantiateViewController(withIdentifier: "RegistrationPage") as? RegistrationPage
        guard let registredUserEmail = fromRegPage!.emailInput.text else { return }
        goToDetailsPage?.userEmailFromRegistration = registredUserEmail
    }

}

