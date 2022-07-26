
import UIKit

class MovieListController: UIViewController {

    @IBOutlet weak var mainTableView: UITableView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        mainTableView.delegate = self
        mainTableView.dataSource = self
    }
    
}

extension MovieListController: UITableViewDelegate, UITableViewDataSource, testDelegate {
    
    func seenUnseen(cell: MoviesCell) {
        let movieTitle = cell.titleLbl.text
        
        guard let movie = moviesList.first(where: {
            $0.title == movieTitle
        }) else { return }
        
        movie.seen.toggle()
        
        mainTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return moviesList.filter { $0.seen == false }.count
        case 1:
            return moviesList.filter { $0.seen == true }.count
        default:
            return 0
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let labelNotSeen = UILabel()
        labelNotSeen.text = " Not seen"
        labelNotSeen.backgroundColor = UIColor.green
        
        let labelSeen = UILabel()
        labelSeen.text = " Seen"
        labelSeen.backgroundColor = UIColor.gray
        
        if section == 0 {
            return labelNotSeen
        } else {
            return labelSeen
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MoviesCell", for: indexPath) as! MoviesCell
                    
        let thisMovies = indexPath.section == 0 ? moviesList.filter { $0.seen == false }[indexPath.row] : moviesList.filter { $0.seen == true }[indexPath.row]
        
        cell.seenNotSeenDelegate = self
        
        cell.titleLbl.text = "\(thisMovies.title)"
        cell.imdbLbl.text = "\(thisMovies.imdb)"
        cell.seenNotSeenStatus.tintColor = thisMovies.seen == true ? UIColor.green : UIColor.red
        return cell
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
    
    //MARK: delegaciaaaaaa
//    func seenUnseen(cell: MoviesCell) {
//        if let indexPath = mainTableView.indexPath(for: cell) {
//            var movieRow = moviesList[indexPath.row]
//            movieRow.seen = true
//            mainTableView.reloadData()
//        }
//    }

    
}



    
    
    
    
    

