import UIKit

class goToRemaindersCategoryListViewController: UIViewController {

    @IBOutlet weak var categoryTableView: UITableView!
    
    let fileManagerUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoryTableView.delegate = self
        categoryTableView.dataSource = self
        
        print(fileManagerUrl!.path)
        
    }


    @IBAction func goBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    

}


extension goToRemaindersCategoryListViewController: UITableViewDelegate, UITableViewDataSource {


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numberOfItems = try? FileManager.default.contentsOfDirectory(atPath: fileManagerUrl!.path)
        return numberOfItems!.count - 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = categoryTableView.dequeueReusableCell(withIdentifier: "CategoryTableViewCell", for: indexPath) as! CategoryTableViewCell
        let itemsDir = try? FileManager.default.contentsOfDirectory(atPath: fileManagerUrl!.path)
        let filteredDir = itemsDir?.filter({ elem in
            elem != ".DS_Store"
        }).sorted()
        let currentfilteredDir = filteredDir![indexPath.row]
        cell.categoryNameLbl.text = currentfilteredDir
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "RemaindersTableViewController") as? RemaindersTableViewController else { return }
        present(vc, animated: true)
    }
    
    
    
    
}



