
import UIKit

class ViewController: UIViewController {
    
    let backgroundView = UIImageView()
    let titleName = UILabel()
    let logo = UIImageView()
    let textFieldEmail = UITextField()
    let textFieldPassword = UITextField()
    let signInButton = UIButton()
    let signUpButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addbackgroundView()
        addTitleName()
        addlogo()
        addtextFieldEmail()
        addtextFieldPassword()
//        addsignInButton()
//        addsignUpButton()
    }
    
    func addbackgroundView() {
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.image = UIImage(named: "123")
        view.addSubview(backgroundView)
        
        let top = NSLayoutConstraint(item: backgroundView,
                                     attribute: .top,
                                     relatedBy: .equal,
                                     toItem: view.layoutMarginsGuide,
                                     attribute: .top,
                                     multiplier: 1,
                                     constant: 0).isActive = true

        let left = NSLayoutConstraint(item: backgroundView,
                                      attribute: .left,
                                      relatedBy: .equal,
                                      toItem: view,
                                      attribute: .left,
                                      multiplier: 1,
                                      constant: 0).isActive = true

        let right = NSLayoutConstraint(item: backgroundView,
                                       attribute: .right,
                                       relatedBy: .equal,
                                       toItem: view,
                                       attribute: .right,
                                       multiplier: 1,
                                       constant: 0).isActive = true

        let bottom = NSLayoutConstraint(item: backgroundView,
                                        attribute: .bottom,
                                        relatedBy: .equal,
                                        toItem: view.safeAreaLayoutGuide,
                                        attribute: .bottom,
                                        multiplier: 1,
                                        constant: 0).isActive = true
    }

    func addTitleName() {
        titleName.translatesAutoresizingMaskIntoConstraints = false
        titleName.text = "IOS App Templates"
        titleName.textColor = .white
        titleName.font = UIFont.systemFont(ofSize: 30)
        titleName.textAlignment = NSTextAlignment.center
        view.addSubview(titleName)
        
        let top = NSLayoutConstraint(item: titleName,
                                     attribute: .top,
                                     relatedBy: .equal,
                                     toItem: view.safeAreaLayoutGuide,
                                     attribute: .top,
                                     multiplier: 1,
                                     constant: 50).isActive = true
        
        let left = NSLayoutConstraint(item: titleName,
                                      attribute: .left,
                                      relatedBy: .equal,
                                      toItem: view.safeAreaLayoutGuide,
                                      attribute: .left,
                                      multiplier: 1,
                                      constant: 50).isActive = true
        
        let right = NSLayoutConstraint(item: titleName,
                                       attribute: .right,
                                       relatedBy: .equal,
                                       toItem: view.safeAreaLayoutGuide,
                                       attribute: .right,
                                       multiplier: 1,
                                       constant: -50).isActive = true
        
        let height = NSLayoutConstraint(item: titleName,
                                       attribute: .height,
                                       relatedBy: .equal,
                                       toItem: nil,
                                        attribute: .notAnAttribute,
                                       multiplier: 1,
                                       constant: 50).isActive = true
    }
    
    func addlogo() {
        let screenHeight = view.frame.height

        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.image = UIImage(named: "swift logo")
        logo.contentMode = .scaleAspectFill
        view.addSubview(logo)
        
        logo.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        
        let top = NSLayoutConstraint(item: logo,
                                     attribute: .top,
                                     relatedBy: .equal,
                                     toItem: titleName,
                                     attribute: .bottom,
                                     multiplier: 1,
                                     constant: 50).isActive = true
        
        let height = NSLayoutConstraint(item: logo,
                                        attribute: .height,
                                        relatedBy: .equal,
                                        toItem: nil,
                                        attribute: .notAnAttribute,
                                        multiplier: 1,
                                        constant: screenHeight/3).isActive = true
    }

    func addtextFieldEmail() {
        let screenWidth = view.frame.width

        textFieldEmail.translatesAutoresizingMaskIntoConstraints = false
        textFieldEmail.placeholder = "  Email"
        textFieldEmail.font = UIFont.systemFont(ofSize: 20)
        textFieldEmail.layer.cornerRadius = 15
        textFieldEmail.layer.masksToBounds = true
        textFieldEmail.backgroundColor = .white
        view.addSubview(textFieldEmail)
        
        textFieldEmail.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true

        let top = NSLayoutConstraint(item: textFieldEmail,
                                     attribute: .top,
                                     relatedBy: .equal,
                                     toItem: logo,
                                     attribute: .bottom,
                                     multiplier: 1,
                                     constant: 150).isActive = true
        
        let left = NSLayoutConstraint(item: textFieldEmail,
                                      attribute: .left,
                                      relatedBy: .equal,
                                      toItem: view,
                                      attribute: .left,
                                      multiplier: 1,
                                      constant: 50).isActive = true
        
        let right = NSLayoutConstraint(item: textFieldEmail,
                                      attribute: .right,
                                      relatedBy: .equal,
                                      toItem: view,
                                      attribute: .right,
                                      multiplier: 1,
                                      constant: -50).isActive = true
        
        let height = NSLayoutConstraint(item: textFieldEmail,
                                       attribute: .height,
                                       relatedBy: .equal,
                                       toItem: nil,
                                        attribute: .notAnAttribute,
                                       multiplier: 1,
                                       constant: 50).isActive = true
    }

    func addtextFieldPassword() {
        let screenWidth = view.frame.width

        textFieldPassword.translatesAutoresizingMaskIntoConstraints = false
        textFieldPassword.placeholder = "  Password"
        textFieldPassword.font = UIFont.systemFont(ofSize: 20)
        textFieldPassword.layer.cornerRadius = 15
        textFieldPassword.layer.masksToBounds = true
        textFieldPassword.backgroundColor = .white
        view.addSubview(textFieldPassword)
        
        textFieldPassword.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true

        let top = NSLayoutConstraint(item: textFieldPassword,
                                     attribute: .top,
                                     relatedBy: .equal,
                                     toItem: textFieldEmail,
                                     attribute: .bottom,
                                     multiplier: 1,
                                     constant: 30).isActive = true
        
        let left = NSLayoutConstraint(item: textFieldPassword,
                                      attribute: .left,
                                      relatedBy: .equal,
                                      toItem: view,
                                      attribute: .left,
                                      multiplier: 1,
                                      constant: 50).isActive = true
        
        let right = NSLayoutConstraint(item: textFieldPassword,
                                      attribute: .right,
                                      relatedBy: .equal,
                                      toItem: view,
                                      attribute: .right,
                                      multiplier: 1,
                                      constant: -50).isActive = true
        
        let height = NSLayoutConstraint(item: textFieldPassword,
                                       attribute: .height,
                                       relatedBy: .equal,
                                       toItem: nil,
                                        attribute: .notAnAttribute,
                                       multiplier: 1,
                                       constant: 50).isActive = true
    }

    

    
}




//add preview simulator from SwiftUI, but it really very 
//#if canImport(swiftUI) && DEBUG
//import SwiftUI
//struct PreviewViewController_Previews: PreviewProvider {
//    static var previews: some View {
//        ViewControllerPreview {
//            ViewController()
//        }.previewDevice("iPhone 13 Pro Max")
//    }
//}
//
//struct ViewControllerPreview<ViewController: UIViewController>: UIViewControllerRepresentable {
//    let viewControllerBuilder: () -> UIViewController
//
//    init(_ viewControllerBuilder: @escaping () -> UIViewController) {
//        self.viewControllerBuilder = viewControllerBuilder
//    }
//
//    func makeUIViewController(context: Context) -> some UIViewController {
//        return viewControllerBuilder()
//    }
//
//    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
//    }
//}
//#endif

