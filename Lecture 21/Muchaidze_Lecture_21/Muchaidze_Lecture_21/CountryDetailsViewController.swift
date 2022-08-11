import UIKit

class CountryDetailsViewController: UIViewController {
    
    @IBOutlet weak var CountryNameLbl: UILabel!
    @IBOutlet weak var CountryCapitalLbl: UILabel!
    @IBOutlet weak var CountryAreaLbl: UILabel!
    
    @IBOutlet weak var CountryImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }

    @IBAction func backToListBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}


