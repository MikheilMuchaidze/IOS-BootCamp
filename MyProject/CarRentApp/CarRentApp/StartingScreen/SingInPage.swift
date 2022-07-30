import UIKit

class SingInPage: UIViewController {
        
    @IBOutlet weak var logoImage: UIImageView!
    
    @IBOutlet weak var usernameLbl: UILabel!
    @IBOutlet weak var userPasswordLbl: UILabel!
    
    @IBOutlet weak var usernameTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func singInBtn(_ sender: Any) {
        
    }
    
    @IBAction func singUpBtn(_ sender: Any) {
        let goToSignUpPage = storyboard?.instantiateViewController(withIdentifier: "signUpPage") as? signUpPage
        self.navigationController?.pushViewController(goToSignUpPage!, animated: true)
        goToSignUpPage?.newUserDelegate = self
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        let textFieldsList = [usernameTxtField, passwordTxtField]
        
        textFieldsList.forEach { elem in
            elem?.setCorner(radius: 20)
            elem?.setBorder(width: 3, color: UIColor.blue)
        }
        
        logoImage.backgroundColor = .clear
    }
}

extension UIView {
  func setCorner(radius: CGFloat) {
        layer.cornerRadius = radius
        clipsToBounds = true
    }
}

extension UIView {
    func setBorder(width: CGFloat, color: UIColor) {
        layer.borderColor = color.cgColor
        layer.borderWidth = width
    }
}

extension SingInPage: newUserToUserLists {
    func registerNewUser(registeredUserName: String, registeredUserPass: String, registeredRepeatPass: String, registeredUserEmail: String) {
        
        let newUser = Users(username: registeredUserName,
                            password: registeredUserPass,
                            repeatedPassword: registeredRepeatPass,
                            email: registeredUserEmail)
        usersList.append(newUser)
        
        usersList.forEach({ elem in
            print("\(elem.username) - \(elem.password) - \(elem.repeatedPassword) - \(elem.email)")
        })
    }
}

