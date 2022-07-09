//
//  ViewController.swift
//  Segues
//
//  Created by Vasili Baramidze on 08.07.22.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func showAlert(_ sender: Any) {
        let alertController = UIAlertController(title: "სათაური", message: "შეტყობინება", preferredStyle: .actionSheet)
        let action = UIAlertAction(title: "ok", style: .cancel)
        alertController.addAction(action)
        self.present(alertController, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print(Self.self, #function )
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print(Self.self, #function )
    }
    
    
    @IBAction func showBluePage(_ sender: Any) {
//        self.storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "BlueVC") as? BlueVC
        guard let vc = vc else { return }
        vc.color = .green
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
    @IBAction func pushToBlueVC(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "BlueVC") as? BlueVC
        guard let vc = vc else { return }
        vc.color = .yellow
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

