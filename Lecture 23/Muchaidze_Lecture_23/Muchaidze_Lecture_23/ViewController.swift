import UIKit

struct API_DATA {
    static let API_KEY = "c78b72820646a4860d6b67948bccc37f"
    static let topRatedMovies = "https://api.themoviedb.org/3/tv/top_rated?api_key=<<api_key>>&language=en-US&page=1"
    static let link = "https://api.themoviedb.org/3/tv/top_rated?api_key=c78b72820646a4860d6b67948bccc37f&language=en-US&page=1"
}

class ViewController: UIViewController {
    
    let networkService = NetworkCall()
    var movies = [MovieResponse.Movie]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkService.getDataFromAPI(fromUrlString: API_DATA.link) { (movie: MovieResponse) in
            self.movies = movie.results
            self.movies.forEach { elem in
                print("Show name: \(elem.name), Show ID: \(elem.id)")
            }
        }
        
    }


}



