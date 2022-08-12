import UIKit


class CountryTableViewController: UIViewController {
            
    @IBOutlet weak var tableVIew: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableVIew.delegate = self
        tableVIew.dataSource = self
        
        searchBar.delegate = self
        
        getCountries()
    
    }
    
}

extension CountryTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filteredCountriesList.isEmpty ? countriesList.count : filteredCountriesList.count
//        countriesList.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let goToDetails = storyboard?.instantiateViewController(withIdentifier: "CountryDetailsViewController") as! CountryDetailsViewController
        
        let thisCountry = filteredCountriesList.isEmpty ? countriesList[indexPath.row] : filteredCountriesList[indexPath.row]
//        let thisCountry = countriesList[indexPath.row]
        
        goToDetails.country = thisCountry
        self.navigationController?.pushViewController(goToDetails, animated: true)
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryTableViewCell", for: indexPath) as? CountryTableViewCell
        
        let currentCountry = filteredCountriesList.isEmpty ? countriesList[indexPath.row] : filteredCountriesList[indexPath.row]
//        let currentCountry = countriesList[indexPath.row]
        
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
            let object = try! decoder.decode([Country].self, from: data!)
            DispatchQueue.main.async {
                countriesList = object
                self.tableVIew.reloadData()
            }
            
        }.resume()
        
    }
    
}


//movidzie informacia chemi dawerili ar aris !
extension CountryTableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredCountriesList.removeAll()
        
        if searchText == ""{
            filteredCountriesList = countriesList
        } else {
            for item in countriesList {
                if item.name.lowercased().contains(searchText.lowercased()) {
                    filteredCountriesList.append(item)
                }
            }
        }
        self.tableVIew.reloadData()
    }
    
    
}

