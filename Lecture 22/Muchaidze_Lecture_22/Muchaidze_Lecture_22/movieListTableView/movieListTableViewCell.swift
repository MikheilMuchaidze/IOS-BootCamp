import UIKit

class movieListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var movieNameLbl: UILabel!
    @IBOutlet weak var movieVoteAvarageLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
