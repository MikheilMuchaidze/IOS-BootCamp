//
//  ViewController.swift
//  Memory Management
//
//  Created by Vasili Baramidze on 17.08.22.
//

import UIKit

protocol ViewControllerDelegate {
    func makeSomeAction()
}

class ViewController: UIViewController, ViewControllerDelegate {
    
    func makeSomeAction() {
        print("🍑")
    }
    
    var testStruct = SomeStructForTest()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        createObjects()
    }
    
    func createObjects() {
        let player = Player(name: "Messi", sport: nil, number: 10)
        let sport = Sport(player: nil, name: "soccer")
        sport.player = player
        player.sport = sport
    }
    
    @IBAction func goToOrangeVC(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "OrangeVC") as! OrangeVC
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
}

