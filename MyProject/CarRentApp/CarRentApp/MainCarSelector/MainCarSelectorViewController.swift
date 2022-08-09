import UIKit

class MainCarSelectorViewController: UIViewController {
    
    @IBOutlet weak var logoutBtnImage: UIImageView!
    @IBOutlet weak var profileBtnImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //adding userinteractions to logout and profile images
        logoutBtnImage.isUserInteractionEnabled = true
        addTapTologoutImage()
        profileBtnImage.isUserInteractionEnabled = true
        addTapToAccountImage()


    }
    
}

extension MainCarSelectorViewController {
    //add tap function to logout image: goes back to sign in page
    func addTapTologoutImage() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapToLogout))
        logoutBtnImage.addGestureRecognizer(tapGesture)
    }
    
    @objc func tapToLogout() {
        self.navigationController?.popViewController(animated: true)
    }
    
    //add tap function to account details image: goes to details page
    func addTapToAccountImage() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapToGoAccDetails))
        profileBtnImage.addGestureRecognizer(tapGesture)
    }
    
    @objc func tapToGoAccDetails() {
        let goToDetailsPage = storyboard?.instantiateViewController(withIdentifier: "ProfileDetails") as? ProfileDetails
        self.navigationController?.present(goToDetailsPage!, animated: true)
    }
    
}
