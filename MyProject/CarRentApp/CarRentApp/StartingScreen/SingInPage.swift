import UIKit
import Firebase
import FirebaseAuth

class SingInPage: UIViewController {
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    @IBOutlet weak var greenCircleOutlet: UIImageView!
    @IBOutlet weak var whiteCircleOutlet: UIImageView!
    
    @IBOutlet weak var incorrectUserEmailLbl: UILabel!
    @IBOutlet weak var incorrectPasswordLbl: UILabel!
        
    @IBOutlet weak var logoImage: UIImageView!
    
    @IBOutlet weak var userEmailLbl: UILabel!
    @IBOutlet weak var userPasswordLbl: UILabel!
    
    @IBOutlet weak var userEmailTxtField: UITextField!
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
                self.incorrectUserEmailLbl.alpha = 1
            } else {
                self.incorrectUserEmailLbl.alpha = 0
            }
        
            //verification of users
            usersList.forEach { user in
                
                //already registered username validation
                if user.username != self.userEmailTxtField.text {
                    self.incorrectUserEmailLbl.alpha = 1
                } else {
                    self.incorrectUserEmailLbl.alpha = 0
                }
                
                //already registered username's password validation
                if user.password != self.passwordTxtField.text {
                    self.incorrectPasswordLbl.alpha = 1
                } else {
                    self.incorrectPasswordLbl.alpha = 0
                }
                
                //if username presented and password is correct proceed
                if user.username == self.userEmailTxtField.text && user.password == self.passwordTxtField.text {
                    self.loginFire()
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
    
    //delete data from textfields after moving to other view
    override func viewWillAppear(_ animated: Bool) {
        whiteCircleOutlet.isHidden = true
        greenCircleOutlet.isHidden = true
        
        userEmailTxtField.text?.removeAll()
        passwordTxtField.text?.removeAll()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        animateBackgroundCircles(image: whiteCircleOutlet, time: 0.02)
        animateBackgroundCircles(image: greenCircleOutlet, time: 0.1)
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        whiteCircleOutlet.isHidden = true
        greenCircleOutlet.isHidden = true
        
        indicator.isHidden = true

        let textFieldsList = [userEmailTxtField, passwordTxtField]
        
        textFieldsList.forEach { elem in
            elem?.setCorner(radius: 20)
            elem?.setBorder(width: 3, color: UIColor.blue)
        }
        
        logoImage.backgroundColor = .clear
        
        //giving starter error messeges 100% transperence
        incorrectUserEmailLbl.alpha = 0
        incorrectPasswordLbl.alpha = 0
    }
}

extension SingInPage: newUserToUserLists {
    
    //firebase login
    func loginFire() {
        Auth.auth().signIn(withEmail: userEmailTxtField.text!, password: passwordTxtField.text!) { [weak self] authResult, error in
            guard let strongSelf = self else { return }
            if let error = error {
                print(error.localizedDescription)
            }
        }
        checkUserInfoFire()
    }
    
    //firebase check user
    func checkUserInfoFire() {
        if Auth.auth().currentUser != nil {
            print(Auth.auth().currentUser?.uid)
        }
        
    }
    
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
            alertPopUp(title: "User Exists", message: "User with this username already exists", okTitle: "Try again.")
        } else {
            usersList.append(newUser)
            
            usersList.forEach({ elem in
                print("\(elem.username) - \(elem.password) - \(elem.repeatedPassword) - \(elem.email)")
            })
        }
    }
}


