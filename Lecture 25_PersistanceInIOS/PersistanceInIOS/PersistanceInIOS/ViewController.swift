//
//  ViewController.swift
//  PersistanceInIOS
//
//  Created by Vasili Baramidze on 22.08.22.
//

import UIKit

class Human: Codable {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var textFieldForSave: UITextField!
    @IBOutlet weak var nameLbl: UILabel!
    
    var names = [
        "giorgi",
        "daviti",
        "ana",
        "mariani",
        "nino"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        textFieldForSave.text = UserDefaults.standard.textFieldText
        nameLbl.text = UserDefaults.standard.randomHuman?.name
        
        let pathOfplist = NSSearchPathForDirectoriesInDomains(
            .libraryDirectory,
            .userDomainMask,
            true
        )
    }
    
    @IBAction func savePersonAction(_ sender: Any) {
        let randomName = names.randomElement()!
        let humanForSave = Human(name: randomName, age: Int.random(in: 1...100))
        print(humanForSave)
        nameLbl.text = humanForSave.name
        UserDefaults.standard.randomHuman = humanForSave
    }
    
    @IBAction func saveData(_ sender: Any) {
        if !textFieldForSave.text!.isEmpty {
            print(textFieldForSave.text!)
            UserDefaults.standard.textFieldText = textFieldForSave.text
        }
    }
}

