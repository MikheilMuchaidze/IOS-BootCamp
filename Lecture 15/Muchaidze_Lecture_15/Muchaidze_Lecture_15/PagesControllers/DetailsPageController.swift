
import UIKit

class DetailsPageController: UIViewController {
    
    var moviesList : Movie!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLbl.text = "Title: \(moviesList.title)"
        releaseDateLbl.text = "Release Year: \(moviesList.releaseDate)"
        imdbLbl.text = "IMDB rating: \(moviesList.imdb)"
        mainActorLbl.text = "Main Actor: \(moviesList.mainActor)"
    }
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var releaseDateLbl: UILabel!
    @IBOutlet weak var imdbLbl: UILabel!
    @IBOutlet weak var mainActorLbl: UILabel!
    
    
    @IBAction func backBtn(_ sender: Any) {
//        self.navigationController.popViewController(animated: true)
        self.navigationController?.popToRootViewController(animated: true)
    }

    
    
}
