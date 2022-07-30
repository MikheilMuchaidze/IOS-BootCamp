import UIKit

protocol newUserToUserLists {
    func registerNewUser(registeredUserName: String, registeredUserPass: String, registeredRepeatPass: String, registeredUserEmail: String)
}

class signUpPage: UIViewController {
    
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
        newUserDelegate?.registerNewUser(registeredUserName: userNameRegisterTxt.text!,
                                         registeredUserPass: userPasswordRegisterTxt.text!,
                                         registeredRepeatPass: userPasswordRepeatTxt.text!,
                                         registeredUserEmail: userEmailRegisterTxt.text!)
        navigationController?.popViewController(animated: true)
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

