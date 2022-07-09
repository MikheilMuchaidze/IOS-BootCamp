//
//  RegistrationPage.swift
//  Muchaidze_Lecture_14
//
//  Created by Misha Muchaidze on 20220709...
//

import UIKit

class RegistrationPage: UIViewController {

    @IBOutlet weak var emailInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    @IBOutlet weak var userNameInput: UITextField!
    
    
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
        
        checkUserInputsAndGoBack()
    }
    
    @IBAction func backToLoginPage(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    func checkUserInputsAndGoBack() {
        guard let registeredUserName = userNameInput.text else { return }
        guard let registeredUserPassword = passwordInput.text else { return }
        
        let goToLoginPage = storyboard?.instantiateViewController(withIdentifier: "LoginPage") as? LoginPage
        goToLoginPage?.userNameFromRegistration = registeredUserName
        goToLoginPage?.userPasswordFromRegistration = registeredUserPassword
        self.navigationController?.pushViewController(goToLoginPage!, animated: true)
    }
    
}
