import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var noteInputTxt: UITextField!
    @IBOutlet weak var noteCategoryTxt: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }

    
    @IBAction func addNoteBtn(_ sender: Any) {
        
        let fileManager = FileManager.default
        guard let url = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
        
        if noteInputTxt.text!.isEmpty || noteCategoryTxt.text!.isEmpty {
            
            alertPopUp(title: "Field(s) empty", message: "Fields empty, please input data", okTitle: "Try again")
            
        } else {
            
            guard let note = noteInputTxt.text else { return }
            guard let noteCategory = noteCategoryTxt.text else { return }
            
            //ახალი ფაილი 📁
            let newFolderUrl = url.appendingPathComponent(noteCategory)
            
            try? fileManager.createDirectory(at: newFolderUrl,
                                             withIntermediateDirectories: true,
                                             attributes: [:])
            
            let fileUrl = newFolderUrl.appendingPathComponent(note)
            let noteData = note.data(using: .utf8)!
            fileManager.createFile(atPath: fileUrl.path,
                                   contents: noteData,
                                   attributes: [:])
                        
            noteInputTxt.text = nil
            noteCategoryTxt.text = nil
            
            alertPopUp(title: "Added", message: "Your remainder added to specified category!", okTitle: "Ok.")
            
        }
        
               
    }
    
    
    @IBAction func goToRemaindersCategoryList(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "goToRemaindersCategoryListViewController") as! goToRemaindersCategoryListViewController
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func notificationRequsetBtn(_ sender: Any) {
        let notification = LocalNotification(id: UUID().uuidString, title: "Test Notification", message: "Testing my first notification")
        
        LocalLocationManager.register(notifications: LocalNotification(id: UUID().uuidString, title: "Test Notification", message: "Testing my first notification"), duration: 3, repeats: false, userInfo: ["test": 1])
    }
    
    

}

extension ViewController {
    
//    func promptForAnswer() {
//        let ac = UIAlertController(title: "Write Note", message: nil, preferredStyle: .alert)
//        ac.addTextField()
//
//        let submitAction = UIAlertAction(title: "Add", style: .default) { [unowned ac] _ in
//            let answer = ac.textFields![0]
//            // do something interesting with "answer" here
//        }
//
//        ac.addAction(submitAction)
//
//        present(ac, animated: true)
//    }
    
    
     
    
}


//alert popup error function for all UIViewControllers presented and created
extension UIViewController {
    func alertPopUp(title: String, message: String, okTitle: String) {
        let alertmassege = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: okTitle, style: UIAlertAction.Style.default, handler: nil)
        alertmassege.addAction(okAction)
        self.present(alertmassege, animated: true)
    }
    
    func contentsOfDirectoryAtPath(path: String) -> [String]? {
        guard let paths = try? FileManager.default.contentsOfDirectory(atPath: path) else { return nil }
//        guard let paths = try? FileManager.default().contentsOfDirectoryAtPath(path) else { return nil}
        return paths.map { aContent in (path as NSString).appendingPathComponent(aContent)}
       
    }

    
    
}
