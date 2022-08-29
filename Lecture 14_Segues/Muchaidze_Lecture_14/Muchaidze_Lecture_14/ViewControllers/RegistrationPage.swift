//
//  RegistrationPage.swift
//  Muchaidze_Lecture_14
//
//  Created by Misha Muchaidze on 20220709...
//

import UIKit

class RegistrationPage: UIViewController {
    
//    @propertyWrapper

    @IBOutlet weak var emailInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    @IBOutlet weak var userNameInput: UITextField!
    @IBOutlet weak var passwordConfirmInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func signUpButtons(_ sender: Any) {
        guard let userName = userNameInput.text else { return }
        guard let userPassword = passwordInput.text else { return }
        guard let userEmail = emailInput.text else { return }
        
        if (userName.isEmpty || userPassword.isEmpty || userEmail.isEmpty) {
            let alertMessage = UIAlertController(title: "Empty field found", message: "all fields must be completed", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
            alertMessage.addAction(okAction)
            self.present(alertMessage, animated: true)
            return
        }
        
        if (passwordInput.text != passwordConfirmInput.text) {
            let alertMessage = UIAlertController(title: "Password don't match", message: "Password and confirm password do not match, please try again", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
            alertMessage.addAction(okAction)
            self.present(alertMessage, animated: true)
        }
        
        checkUserInputsAndGoBack()
    }
    
    @IBAction func backToLoginPage(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    func checkUserInputsAndGoBack() {
        guard let registeredUserName = userNameInput.text else { return }
        guard let registeredUserPassword = passwordInput.text else { return }
        guard let registeredUserEmail = emailInput.text else { return }
        
        let goToLoginPage = storyboard?.instantiateViewController(withIdentifier: "LoginPage") as? LoginPage
        goToLoginPage?.userNameFromRegistration = registeredUserName
        goToLoginPage?.userPasswordFromRegistration = registeredUserPassword
        goToLoginPage?.userEmailFromRegistration = registeredUserEmail
        self.navigationController?.pushViewController(goToLoginPage!, animated: true)
    }
    
}
