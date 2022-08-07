import UIKit

class userListTable: UIViewController {
    
    @IBOutlet weak var backImageBtn: UIImageView!
    
    @IBAction func goToLoginPage(_ sender: Any) {
        let goToLoginPage = storyboard?.instantiateViewController(withIdentifier: "SingInPage") as? SingInPage
//        self.navigationController?.pushViewController(goToLoginPage!, animated: true)
        
        if let goToLoginPage = goToLoginPage {
            self.navigationController?.pushViewController(goToLoginPage, animated: true)
        }
    }
    
    
    @IBAction func removeAllUsersBtn(_ sender: Any) {
        usersList.removeAll()
        userListTable.reloadData()
    }
    
    @IBOutlet weak var userListTable: UITableView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userListTable.delegate = self
        userListTable.dataSource = self
        
        backImageBtn.isUserInteractionEnabled = true
        addTapToBackPic()
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

extension userListTable {
    func addTapToBackPic() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGoBack))
        backImageBtn.addGestureRecognizer(tapGesture)
    }
    
    @objc func tapGoBack() {
        self.navigationController?.popViewController(animated: true)
    }
}
