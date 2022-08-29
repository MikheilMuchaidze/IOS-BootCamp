import UIKit

class MovieDetailsViewController: UIViewController {
    
    var movie: MovieResponse.Movie!
    
    @IBOutlet weak var MovieNameLbl: UILabel!
    @IBOutlet weak var MovieIDLbl: UILabel!
    @IBOutlet weak var MovieVoteAverageLbl: UILabel!
    @IBOutlet weak var MovieVoteCountLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MovieNameLbl.text = movie.name
        MovieIDLbl.text = "\(movie.id)"
        MovieVoteAverageLbl.text = "\(movie.vote_average)"
        MovieVoteCountLbl.text = "\(movie.vote_count)"
    }
    
}

