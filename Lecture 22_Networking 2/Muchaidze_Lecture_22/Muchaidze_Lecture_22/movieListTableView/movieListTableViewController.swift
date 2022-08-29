import UIKit

class movieListTableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let networkService = NetworkCall()
    let urlStringForTopRatedMovies = "https://api.themoviedb.org/3/tv/top_rated"
    var movies = [MovieResponse.Movie]()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkService.getData(with: urlStringForTopRatedMovies) { (movie: MovieResponse) in
            self.movies = movie.results
            self.tableView.reloadData()
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        
        

    }


}

extension movieListTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieListTableViewCell", for: indexPath) as! movieListTableViewCell
        let thisMovie = movies[indexPath.row]
        cell.movieNameLbl.text = thisMovie.name
        cell.movieVoteAvarageLbl.text = "\(thisMovie.vote_average)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let goToDetails = storyboard?.instantiateViewController(withIdentifier: "MovieDetailsViewController") as! MovieDetailsViewController
        let thisMovie = movies[indexPath.row]
        goToDetails.movie = thisMovie
        self.navigationController?.pushViewController(goToDetails, animated: true)
    }
    
    
    
    
}

