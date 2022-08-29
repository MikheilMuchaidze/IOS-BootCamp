
import UIKit


protocol testDelegate {
    func seenUnseen(cell: MoviesCell)
}

class MoviesCell: UITableViewCell {
    
    var seenNotSeenDelegate: testDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected states
    }
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var imdbLbl: UILabel!
    @IBOutlet weak var seenNotSeenStatus: UIImageView!
    
    @IBAction func seenUnseenBtn(_ sender: Any) {
        seenNotSeenDelegate?.seenUnseen(cell: self)
        print("seen status changed")
    }

}

