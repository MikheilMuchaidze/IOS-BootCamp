//
//  BlueVC.swift
//  Segues
//
//  Created by Vasili Baramidze on 08.07.22.
//

import UIKit

class BlueVC: UIViewController {

    var color: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        addCutomView()
    }
    
    func setupUI() {
        view.backgroundColor = color
    }
    
    func addCutomView() {
        let myView = Bundle.main.loadNibNamed("CustomView", owner: nil, options: nil)![0] as? CustomView
        myView?.frame = CGRect(x: 20, y: 50, width: 150, height: 85)
        myView?.delegate = self
        myView?.someAction = shopdsddfb
        view.addSubview(myView!)
    }
    
    func shopdsddfb(sassss: String) {
        let alertController = UIAlertController(title: "სათაური", message: sassss, preferredStyle: .actionSheet)
        let action = UIAlertAction(title: "ok", style: .cancel)
        alertController.addAction(action)
        self.present(alertController, animated: true)
    }
    
    @IBAction func dissmiss(_ sender: Any) {
     
        
        showAlert(with: "sajgsajsa")
//        if self.navigationController == nil {
//            self.dismiss(animated: true)
//        } else {
//            self.navigationController?.popViewController(animated: true)
//        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension BlueVC: CustomViewDelegate {
    func showAlert(with title: String) {
        let alertController = UIAlertController(title: "სათაური", message: title, preferredStyle: .actionSheet)
        let action = UIAlertAction(title: "ok", style: .cancel)
        alertController.addAction(action)
        self.present(alertController, animated: true)
    }
}
