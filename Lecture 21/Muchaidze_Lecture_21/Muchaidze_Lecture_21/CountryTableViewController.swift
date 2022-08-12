import UIKit


class CountryTableViewController: UIViewController {
            
    @IBOutlet weak var tableVIew: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
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
        let thisCountry = countriesList[indexPath.row]
        goToDetails.country = thisCountry
        self.navigationController?.pushViewController(goToDetails, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        countriesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryTableViewCell", for: indexPath) as? CountryTableViewCell
        let currentCountry = countriesList[indexPath.row]
        cell?.countryName.text = currentCountry.name ?? "No value for countries name"
        
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
            let object = try! decoder.decode([Counrtry].self, from: data!)
            DispatchQueue.main.async {
                countriesList = object
                self.tableVIew.reloadData()
            }
            
        }.resume()
        
    }
    
}

