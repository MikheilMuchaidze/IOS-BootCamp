import UIKit

class userListTable: UIViewController {
    
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBOutlet weak var userListTable: UITableView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        userListTable.reloadData()
        userListTable.delegate = self
        userListTable.dataSource = self
    }
}

extension userListTable: UITableViewDelegate, UITableViewDataSource {
            
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersList.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = userListTable.dequeueReusableCell(withIdentifier: "adminTableCell", for: indexPath) as! adminTableCell
        
        let thisUser = usersList[indexPath.row]
        cell.userNameLbl.text = "  \(thisUser.username)"
        cell.userPassLbl.text = "  \(thisUser.password)"
        cell.userEmailLbl.text = "  \(thisUser.email)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            usersList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        }
    }


    
}
