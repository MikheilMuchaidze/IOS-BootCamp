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
        
    }
    
    
    @IBAction func goToRemaindersCategoryList(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "goToRemaindersCategoryListViewController") as! goToRemaindersCategoryListViewController
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    

}

