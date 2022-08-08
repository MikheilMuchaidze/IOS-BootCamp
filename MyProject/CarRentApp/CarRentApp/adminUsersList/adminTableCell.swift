import UIKit

class adminTableCell: UITableViewCell {
    
    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var userPassLbl: UILabel!
    @IBOutlet weak var userEmailLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //grouping all labels
        let labelList = [userNameLbl, userPassLbl, userEmailLbl]
        
        //giving all labels corner radius and border properties with color
        labelList.forEach { elem in
            elem?.setCorner(radius: 10)
            elem?.setBorder(width: 3, color: UIColor.tintColor)
        }
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
