import UIKit

class MainCarSelectorViewController: UIViewController {
    
    @IBOutlet weak var backBtnImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addTapToBackPic()

    }
    
}

extension MainCarSelectorViewController {
    func addTapToBackPic() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGoBack))
        backBtnImage.addGestureRecognizer(tapGesture)
    }
    
    @objc func tapGoBack() {
        self.navigationController?.popViewController(animated: true)
    }
}
