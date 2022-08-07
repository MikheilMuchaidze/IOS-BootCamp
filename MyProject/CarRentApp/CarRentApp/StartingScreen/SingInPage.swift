import UIKit

class SingInPage: UIViewController {
    
    @IBOutlet weak var incorrectUsernameLbl: UILabel!
    @IBOutlet weak var incorrectPasswordLbl: UILabel!
        
    @IBOutlet weak var logoImage: UIImageView!
    
    @IBOutlet weak var usernameLbl: UILabel!
    @IBOutlet weak var userPasswordLbl: UILabel!
    
    @IBOutlet weak var usernameTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    
    @IBAction func backBtn(_ sender: Any) {
        usersList.removeAll()
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func singInBtn(_ sender: Any) {
        
        usersList.forEach { user in
            
            if user.username != usernameTxtField.text {
                incorrectUsernameLbl.alpha = 1
            } else {
                incorrectUsernameLbl.alpha = 0
            }
            
            if user.password != passwordTxtField.text {
                incorrectPasswordLbl.alpha = 1
            } else {
                incorrectPasswordLbl.alpha = 0
            }
            
            if user.username == usernameTxtField.text && user.password == passwordTxtField.text {
                let goToCarSelection = storyboard?.instantiateViewController(withIdentifier: "MainCarSelectorViewController") as? MainCarSelectorViewController
                self.navigationController?.pushViewController(goToCarSelection!, animated: true)
            }
        }
        
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
        
        incorrectUsernameLbl.alpha = 0
        incorrectPasswordLbl.alpha = 0
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
        
        let usernamesList = usersList.map { elem in
            elem.username
        }
        
        if usernamesList.contains(where: { elem in
            elem == registeredUserName
        }) {
            let alertmassege = UIAlertController(title: "User Exists", message: "User with this username already exists", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "Try again.", style: UIAlertAction.Style.default, handler: nil)
            alertmassege.addAction(okAction)
            self.present(alertmassege, animated: true)
        } else {
            usersList.append(newUser)
            
            usersList.forEach({ elem in
                print("\(elem.username) - \(elem.password) - \(elem.repeatedPassword) - \(elem.email)")
            })
        }
        
    }
}

