import UIKit

protocol newUserToUserLists {
    func registerNewUser(registeredUserName: String, registeredUserPass: String, registeredRepeatPass: String, registeredUserEmail: String)
}

class signUpPage: UIViewController {
    
    //MARK: show/hide password
    var iconClick = false
    let imageicon = UIImageView()
    
    @IBAction func adminBtn(_ sender: Any) {
        let goToAdminPage = storyboard?.instantiateViewController(withIdentifier: "userListTable") as? userListTable
        self.navigationController?.pushViewController(goToAdminPage!, animated: true)
    }
    
    @IBAction func backToSignInPageBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func clearAllFieldsBtn(_ sender: Any) {
        let fieldsList = [userNameRegisterTxt, userPasswordRegisterTxt, userPasswordRepeatTxt, userEmailRegisterTxt]
        fieldsList.forEach { elem in
            elem?.text?.removeAll()
        }
    }
    
    @IBOutlet weak var userNameRegisterTxt: UITextField!
    @IBOutlet weak var userPasswordRegisterTxt: UITextField!
    @IBOutlet weak var userPasswordRepeatTxt: UITextField!
    @IBOutlet weak var userEmailRegisterTxt: UITextField!
    
    var newUserDelegate: newUserToUserLists?
    
    @IBAction func registerUserBtn(_ sender: Any) {
        checkForEmptyFields()
        checkForPassSimilarity()
        
        if userNameRegisterTxt.text != "" &&
            userPasswordRegisterTxt.text  != "" &&
            userPasswordRepeatTxt.text  != "" &&
            userEmailRegisterTxt.text  != "" &&
            userPasswordRegisterTxt.text == userPasswordRepeatTxt.text {
            
            newUserDelegate?.registerNewUser(registeredUserName: userNameRegisterTxt.text!,
                                             registeredUserPass: userPasswordRegisterTxt.text!,
                                             registeredRepeatPass: userPasswordRepeatTxt.text!,
                                             registeredUserEmail: userEmailRegisterTxt.text!)
            navigationController?.popViewController(animated: true)
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let textFieldsList = [userNameRegisterTxt, userPasswordRegisterTxt, userPasswordRepeatTxt, userEmailRegisterTxt]
        textFieldsList.forEach { elem in
            elem?.setCorner(radius: 20)
            elem?.setBorder(width: 3, color: UIColor.gray)
        }


        
    }
    

}

extension signUpPage {
    
    func checkForEmptyFields() {
        if userNameRegisterTxt.text == "" ||
            userPasswordRegisterTxt.text  == "" ||
            userPasswordRepeatTxt.text  == "" ||
            userEmailRegisterTxt.text  == "" {
            
            let alertmassege = UIAlertController(title: "Field(s) empty.", message: "All fields must be completed.", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "Ok.", style: UIAlertAction.Style.default, handler: nil)
            alertmassege.addAction(okAction)
            self.present(alertmassege, animated: true)
        }
    }
    
    func checkForPassSimilarity() {
        if userPasswordRegisterTxt.text != userPasswordRepeatTxt.text {
            
            let alertmassege = UIAlertController(title: "Passwords not match.", message: "Passwrods must be a match! Try again.", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
            alertmassege.addAction(okAction)
            self.present(alertmassege, animated: true)
        }
    }
    
    
    


}

