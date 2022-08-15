import UIKit

class movieListTableViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    let testArray = ["111", "222", "333", "444"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        fetchMovieData { MovieResponse in
            MovieResponse.results.forEach { elem in
                print(elem.name)
            }
        }

    }
    
    func fetchMovieData(completionHandler: @escaping (MovieResponse) -> Void) {
        
        let url = URL(string: "https://api.themoviedb.org/3/tv/top_rated?api_key=c78b72820646a4860d6b67948bccc37f&language=en-US&page=1")!
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data else { return }
            
            do {
                let movieData = try JSONDecoder().decode(MovieResponse.self, from: data)
                completionHandler(movieData)
            } catch {
                let error = error
                print(error.localizedDescription)
            }
        
        }.resume()
        
    }

}

extension movieListTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieListTableViewCell", for: indexPath) as! movieListTableViewCell
        let thisMovie = testArray[indexPath.row]
        cell.movieNameLbl.text = thisMovie
        return cell
    }
    
    
    
}

