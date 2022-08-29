//
//  OrangeVC.swift
//  Memory Management
//
//  Created by Vasili Baramidze on 17.08.22.
//

import UIKit

class OrangeVC: UIViewController {
    
    @IBOutlet weak var titleLbl: UILabel!
    
    var closure: ((String)->Void)?
    var text: String = ""
    var delegate: ViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        closure = { item in
//            print(item)
//            self.text = item
//            self.titleLbl.text = item
//        }
    }
    
    @IBAction func makeActionOnOrange(_ sender: Any) {
        self.delegate.makeSomeAction()
    }
    
    deinit {
        print("OrangeVC is deallocated")
    }

}
