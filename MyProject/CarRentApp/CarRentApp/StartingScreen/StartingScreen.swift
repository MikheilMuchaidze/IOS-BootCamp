import UIKit

class StartingScreen: UIViewController {
    
    @IBAction func startButton(_ sender: Any) {
        let goToSignInPage = storyboard?.instantiateViewController(withIdentifier: "SingInPage") as? SingInPage
        self.navigationController?.pushViewController(goToSignInPage!, animated: true)
    }
    
    @IBOutlet weak var statementLbl: UILabel!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
