import UIKit

class CountryDetailsViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()



    }

    @IBAction func backToListBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
