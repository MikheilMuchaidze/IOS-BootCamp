import UIKit

class CountryDetailsViewController: UIViewController {
    
    var country: Counrtry!
    
    @IBOutlet weak var CountryNameLbl: UILabel!
    @IBOutlet weak var CountryCapitalLbl: UILabel!
    @IBOutlet weak var CountryPopulation: UILabel!
    
    @IBOutlet weak var CountryImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        CountryNameLbl.text = country.name
        CountryCapitalLbl.text = country.capital
        if let population = country.population {
            CountryPopulation.text = "\(population)"
        }
        if let url = country.flag {
            CountryImage.load(url: URL(string: url)!)
        }

        
    }

    @IBAction func backToListBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}


