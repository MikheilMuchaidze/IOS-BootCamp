import UIKit
import CoreData

class NoteDetailVC: UIViewController {
    
    @IBOutlet weak var titleTxt: UITextField!
    @IBOutlet weak var descriptionTxt: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func saveBtn(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Note", in: context)
        let newNote = Note(entity: entity!, insertInto: context)
        newNote.id = noteList.count as NSNumber
        newNote.title = titleTxt.text
        newNote.desc = descriptionTxt.text
        
        do {
            try context.save()
            noteList.append(newNote)
            navigationController?.popViewController(animated: true)
            print("saved")
        } catch {
            print("context save error")
        }
        
    }
    
    
}

