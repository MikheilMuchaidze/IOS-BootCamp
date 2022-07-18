
import UIKit

class MoviesCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var imdbLbl: UILabel!
    
    @IBAction func seenUnseenBtn(_ sender: Any) {
    }
    
    
    
}
