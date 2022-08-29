import UIKit
import CoreData

var noteList = [Note]()

class NoteTableView: UITableViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()

    }
        
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let noteCell = tableView.dequeueReusableCell(withIdentifier: "noteCellID") as! NoteCell
        
        let thisNote: Note!
        thisNote = noteList[indexPath.row]
        
        noteCell.titleLbl.text = thisNote.title
        noteCell.descriptionLbl.text = thisNote.desc
        
        return noteCell
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return noteList.count
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    
}
