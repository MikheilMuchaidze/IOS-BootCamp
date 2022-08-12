import UIKit

class CountryDetailsViewController: UIViewController {
    
    var country: Country!
    
    @IBOutlet weak var CountryNameLbl: UILabel!
    @IBOutlet weak var CountryCapitalLbl: UILabel!
    @IBOutlet weak var CountryPopulation: UILabel!
    
    @IBOutlet weak var CountryImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemGray
        CountryImage.contentMode = .scaleToFill
        CountryImage.layer.cornerRadius = 10
        
        CountryNameLbl.text = country.name
        CountryCapitalLbl.text = country.capital
        if let population = country.population {
            CountryPopulation.text = "\(population)"
        }
        
        CountryImage.load(url: country.flags.png)
        
    }

    @IBAction func backToListBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}


