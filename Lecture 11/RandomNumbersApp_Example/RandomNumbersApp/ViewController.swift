//
//  ViewController.swift
//  RandomNumbersApp
//
//  Created by Dato Khvedelidze on 02.07.22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstRandomNumber: UILabel!
    @IBOutlet weak var secondRandomNumber: UILabel!
    @IBOutlet weak var thirdRandomNumber: UILabel!
    @IBOutlet weak var decision: UITextField!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var finalLabel: UILabel!
    
    var firstRandomNumberValue = 0
    var secondRandomNumberValue = 0
    var thirdRandomNumberValue = 0
    
    func decisionText() {
        let inputText = decision.text
        switch inputText {
        case "maximum":
            finalLabel.text = "The maximum of these 3 random numbers is \(max(firstRandomNumberValue, secondRandomNumberValue, thirdRandomNumberValue))"
        case "avarage":
            finalLabel.text = "The avarage of these 3 random numbers is \(round((Double(firstRandomNumberValue) + Double(secondRandomNumberValue) + Double(thirdRandomNumberValue)) / 3 * 1000) / 1000)"
        case "sum":
            finalLabel.text = "The summary of 3 these random numbers is \(firstRandomNumberValue + secondRandomNumberValue + thirdRandomNumberValue)"
        default:
            finalLabel.text = "Wrong word, please try again"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func slider(_ sender: UISlider) {
        let valueOfUpperEdge = sender.value
        
        firstRandomNumberValue = Int.random(in: 0...Int(valueOfUpperEdge))
        secondRandomNumberValue = Int.random(in: 0...Int(valueOfUpperEdge))
        thirdRandomNumberValue = Int.random(in: 0...Int(valueOfUpperEdge))
        
        firstRandomNumber.text = "First random number: \(firstRandomNumberValue)"
        secondRandomNumber.text = "Second random number: \(secondRandomNumberValue)"
        thirdRandomNumber.text = "Third random number: \(thirdRandomNumberValue)"
        
    }
    
    @IBAction func button(_ sender: UIButton) {
        decisionText()
    }
}

