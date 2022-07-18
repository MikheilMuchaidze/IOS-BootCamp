
import UIKit

class MovieListController: UIViewController, UITableViewDelegate, UITableViewDataSource {
        
    @IBOutlet weak var mainTableView: UITableView!
        
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        moviesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let Cell = tableView.dequeueReusableCell(withIdentifier: "MoviesCell", for: indexPath) as! MoviesCell
        let thisMovies = moviesList[indexPath.row]
        Cell.titleLbl.text = thisMovies.title
        Cell.imdbLbl.text = "\(thisMovies.imdb)"
        return Cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Seen/Unseen test"
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "detailSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "detailSegue") {
            let indexPath = self.mainTableView.indexPathForSelectedRow!
            let tableViewDetail = segue.destination as? DetailsPageController
            
            let selectedMovie = moviesList[indexPath.row]
            tableViewDetail!.moviesList = selectedMovie
            self.mainTableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
}
