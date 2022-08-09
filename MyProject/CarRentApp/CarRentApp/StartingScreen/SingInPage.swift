import UIKit

class SingInPage: UIViewController {
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    @IBOutlet weak var greenCircleOutlet: UIImageView!
    @IBOutlet weak var whiteCircleOutlet: UIImageView!
    
    @IBOutlet weak var incorrectUsernameLbl: UILabel!
    @IBOutlet weak var incorrectPasswordLbl: UILabel!
        
    @IBOutlet weak var logoImage: UIImageView!
    
    @IBOutlet weak var usernameLbl: UILabel!
    @IBOutlet weak var userPasswordLbl: UILabel!
    
    @IBOutlet weak var usernameTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    
    @IBAction func backBtn(_ sender: Any) {
        greenCircleOutlet.alpha = 0
        whiteCircleOutlet.alpha = 0
        usersList.removeAll()
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func singInBtn(_ sender: Any) {
        indicator.isHidden = false
        indicator.startAnimating()
        
        //dispathing for 1 second, like loading from server but manually
        DispatchQueue.main.asyncAfter(deadline: .now() + 1 ) {
            self.indicator.isHidden = true
            self.indicator.stopAnimating()
            
            //username not found when list is empty
            if usersList.isEmpty == true {
                self.incorrectUsernameLbl.alpha = 1
            } else {
                self.incorrectUsernameLbl.alpha = 0
            }
        
            //verification of users
            usersList.forEach { user in
                
                //already registered username validation
                if user.username != self.usernameTxtField.text {
                    self.incorrectUsernameLbl.alpha = 1
                } else {
                    self.incorrectUsernameLbl.alpha = 0
                }
                
                //already registered username's password validation
                if user.password != self.passwordTxtField.text {
                    self.incorrectPasswordLbl.alpha = 1
                } else {
                    self.incorrectPasswordLbl.alpha = 0
                }
                
                //if username presented and password is correct proceed
                if user.username == self.usernameTxtField.text && user.password == self.passwordTxtField.text {
                    let goToCarSelection = self.storyboard?.instantiateViewController(withIdentifier: "MainCarSelectorViewController") as? MainCarSelectorViewController
                    self.navigationController?.pushViewController(goToCarSelection!, animated: true)
                }
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
        
        indicator.isHidden = true

        let textFieldsList = [usernameTxtField, passwordTxtField]
        
        textFieldsList.forEach { elem in
            elem?.setCorner(radius: 20)
            elem?.setBorder(width: 3, color: UIColor.blue)
        }
        
        logoImage.backgroundColor = .clear
        
        //giving starter error messeges 100% transperence
        incorrectUsernameLbl.alpha = 0
        incorrectPasswordLbl.alpha = 0
    }
}

extension UIView {
    //adding corner radius for textfields
    func setCorner(radius: CGFloat) {
        layer.cornerRadius = radius
        clipsToBounds = true
    }
    
    //adding border width and color for textfields
    func setBorder(width: CGFloat, color: UIColor) {
        layer.borderColor = color.cgColor
        layer.borderWidth = width
    }
}

extension SingInPage: newUserToUserLists {
    func registerNewUser(registeredUserName: String, registeredUserPass: String, registeredRepeatPass: String, registeredUserEmail: String) {
        
        //registering new user
        let newUser = Users(username: registeredUserName,
                            password: registeredUserPass,
                            repeatedPassword: registeredRepeatPass,
                            email: registeredUserEmail)
        
        //new array with all already presented users
        let usernamesList = usersList.map { elem in
            elem.username
        }
        
        //checking new user if presented - error messege, if not adding to array of users
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

