import UIKit

class adminTableCell: UITableViewCell {


    
    
    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var userPassLbl: UILabel!
    @IBOutlet weak var userEmailLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let labelList = [userNameLbl, userPassLbl, userEmailLbl]
        
        labelList.forEach { elem in
            elem?.setCorner(radius: 10)
            elem?.setBorder(width: 3, color: UIColor.tintColor)
        }
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
