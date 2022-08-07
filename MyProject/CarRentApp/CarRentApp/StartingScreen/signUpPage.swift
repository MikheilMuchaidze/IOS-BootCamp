import UIKit

protocol newUserToUserLists {
    func registerNewUser(registeredUserName: String, registeredUserPass: String, registeredRepeatPass: String, registeredUserEmail: String)
}

class signUpPage: UIViewController {
    
    @IBOutlet var popupView: UIView!
    
    @IBAction func adminBtn(_ sender: Any) {
        adminPanelPasswordTxt.text?.removeAll()
        animateIn(desiredView: popupView)
    }
    
    @IBOutlet weak var adminPanelPasswordTxt: UITextField!
    
    @IBAction func exitAdminLogin(_ sender: Any) {
        animateOut(desiredView: popupView)
    }
    
    @IBAction func adminLogin(_ sender: Any) {
        if adminPanelPasswordTxt.text == "123" {
            animateOut(desiredView: popupView)
            let goToAdminPage = storyboard?.instantiateViewController(withIdentifier: "userListTable") as? userListTable
            self.navigationController?.pushViewController(goToAdminPage!, animated: true)
        } else {
            let alertmassege = UIAlertController(title: "Incorrect password!", message: "Admin password is incorrect.", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "Ok.", style: UIAlertAction.Style.default, handler: nil)
            alertmassege.addAction(okAction)
            self.present(alertmassege, animated: true)
        }
    }
    
    @IBOutlet weak var backImageBtn: UIImageView!
    
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
        
        backImageBtn.isUserInteractionEnabled = true
        addTapToBackPic()
        
        //set width = 90% of the screen, height = 40% of the screen
        popupView.bounds = CGRect(x: 0, y: 0, width: 250, height: 150)
    }
    
    func animateIn(desiredView: UIView) {
        let backgroundView = self.view!
        
        //attach our desired view to the screen (self.view/backgroundView)
        backgroundView.addSubview(desiredView)
        
        //sets the view's scaling to be 120%
        desiredView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        desiredView.alpha = 0
        desiredView.center = backgroundView.center
        
        //animate the affect
        UIView.animate(withDuration: 0.3, animations: {
            desiredView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            desiredView.alpha = 1
        })
    }
    
    //animate out a specified view
    func animateOut(desiredView: UIView) {
        UIView.animate(withDuration: 0.3, animations: {
            desiredView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            desiredView.alpha = 0
        }, completion: { _ in
            desiredView.removeFromSuperview()
        })
    }

}

extension signUpPage {
    
    func addTapToBackPic() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGoBack))
        backImageBtn.addGestureRecognizer(tapGesture)
    }
    
    @objc func tapGoBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
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

