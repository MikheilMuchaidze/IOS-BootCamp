import UIKit

protocol newUserToUserLists {
    func registerNewUser(registeredUserName: String, registeredUserPass: String, registeredRepeatPass: String, registeredUserEmail: String)
}

class signUpPage: UIViewController {

    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    @IBOutlet weak var cyanCircleOutlet: UIImageView!
    @IBOutlet weak var purpleCircleOutlet: UIImageView!
    
    @IBOutlet var popupView: UIView!
    
    @IBAction func adminBtn(_ sender: Any) {
        adminPanelPasswordTxt.text?.removeAll()
        animateIn(desiredView: popupView)
    }
    
    @IBOutlet weak var adminPanelPasswordTxt: UITextField!
    
    @IBOutlet weak var exitAdminLoginOutlet: UIButton!
    
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
        indicator.isHidden = false
        indicator.startAnimating()
        
        //dispathing for 1 second, like loading from server but manually
        DispatchQueue.main.asyncAfter(deadline: .now() + 1 ) {
            self.indicator.isHidden = true
            self.indicator.stopAnimating()
            
            self.checkForEmptyFields()
            self.checkForPassSimilarity()
            
            if self.userNameRegisterTxt.text != "" &&
                self.userPasswordRegisterTxt.text  != "" &&
                self.userPasswordRepeatTxt.text  != "" &&
                self.userEmailRegisterTxt.text  != "" &&
                self.userPasswordRegisterTxt.text == self.userPasswordRepeatTxt.text {
                
                self.newUserDelegate?.registerNewUser(registeredUserName: self.userNameRegisterTxt.text!,
                                                 registeredUserPass: self.userPasswordRegisterTxt.text!,
                                                 registeredRepeatPass: self.userPasswordRepeatTxt.text!,
                                                 registeredUserEmail: self.userEmailRegisterTxt.text!)
                self.navigationController?.popViewController(animated: true)
            }
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        indicator.isHidden = true
        
        animateBackgroundCircles(image: cyanCircleOutlet)
        animateBackgroundCircles(image: purpleCircleOutlet)
        
        //grouping all textfields
        let textFieldsList = [userNameRegisterTxt, userPasswordRegisterTxt, userPasswordRepeatTxt, userEmailRegisterTxt]
        
        //giving to group of textfields corner and border properties
        textFieldsList.forEach { elem in
            elem?.setCorner(radius: 20)
            elem?.setBorder(width: 3, color: UIColor.gray)
        }
        
        backImageBtn.isUserInteractionEnabled = true
        addTapToBackPic()
        
        //set width = 90% of the screen, height = 40% of the screen
        popupView.bounds = CGRect(x: 0, y: 0, width: 250, height: 150)
        
        //adding color to exit button in popup view accesing admin panel
        exitAdminLoginOutlet.tintColor = .brown
    }

}

extension signUpPage {
    
    func addTapToBackPic() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGoBack))
        backImageBtn.addGestureRecognizer(tapGesture)
    }
    
    @objc func tapGoBack() {
        cyanCircleOutlet.alpha = 0
        purpleCircleOutlet.alpha = 0
        self.navigationController?.popViewController(animated: true)
    }
    
    //checking if all fields are field with some data if not error popup
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
    
    //checking if passwords in password and repeat password fields are similar if not error popup
    func checkForPassSimilarity() {
        if userPasswordRegisterTxt.text != userPasswordRepeatTxt.text {
            
            let alertmassege = UIAlertController(title: "Passwords not match.", message: "Passwrods must be a match! Try again.", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
            alertmassege.addAction(okAction)
            self.present(alertmassege, animated: true)
        }
    }
    
    //animation to make appearing of backgound circles after view is loaded
    func animateBackgroundCircles(image: UIImageView) {
        image.isHidden = true
        UIView.animate(withDuration: 2, delay: 5, options: UIView.AnimationOptions.transitionFlipFromTop, animations: {
            image.alpha = 1
        }, completion: { finished in
            image.isHidden = false
        })
    }
    
    //animate in a specific view
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

