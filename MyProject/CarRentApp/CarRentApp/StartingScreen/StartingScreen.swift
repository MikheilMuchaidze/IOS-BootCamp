import UIKit

class StartingScreen: UIViewController {
    
    @IBAction func startButton(_ sender: Any) {
        
    }
    
    @IBOutlet weak var statementLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        statementLbl.text = "DON'T SIT AT HOME.RIDE! RIDE WITH US!"
    }
}
