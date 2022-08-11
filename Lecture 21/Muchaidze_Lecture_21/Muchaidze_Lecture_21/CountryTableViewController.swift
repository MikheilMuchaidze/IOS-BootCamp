import UIKit

class CountryTableViewController: UIViewController {
    
    @IBOutlet weak var tableVIew: UITableView!
    
    var countriesList = [countries]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableVIew.delegate = self
        tableVIew.dataSource = self
        
        getCountries()
        
        

    }

}


extension CountryTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let goToDetails = storyboard?.instantiateViewController(withIdentifier: "CountryDetailsViewController") as! CountryDetailsViewController
        
        self.navigationController?.pushViewController(goToDetails, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        countriesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryTableViewCell", for: indexPath) as? CountryTableViewCell
        let currentCountry = countriesList[indexPath.row]
        cell?.countryName.text = currentCountry.name
        return cell!
    }
    
    
}


extension CountryTableViewController {
    func getCountries() {
        let urlsString = "https://restcountries.com/v2/all"
        let url = URL(string: urlsString)!
        let urlSession = URLSession.shared
        
        urlSession.dataTask(with: URLRequest(url: url)) { data, response, error in
            let data = data
            let decoder = JSONDecoder()
            let object = try! decoder.decode([countries].self, from: data!)
            DispatchQueue.main.async {
                self.countriesList = object
                self.tableVIew.reloadData()
            }
            
        }.resume()
        
    }
    
}

extension CountryTableViewController {
    struct countries: Codable {
        let name: String
//        let capital: String
//        let area: Int
//        let flag: String
    }
    
    
}
