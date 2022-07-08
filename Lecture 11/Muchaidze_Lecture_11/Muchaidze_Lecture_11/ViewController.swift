//
//  ViewController.swift
//  Muchaidze_Lecture_11
//
//  Created by Misha Muchaidze on 20220630...
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var RandomNumberOne: UILabel!
    @IBOutlet weak var RandomNumberTwo: UILabel!
    @IBOutlet weak var RandomNumberThree: UILabel!
    var labelsList = [UILabel]()
    
    @IBOutlet weak var checkForFunctionWord: UITextField!
    
    @IBOutlet weak var ResultOfFUnction: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("11th lecture test app started!!")
        labelsList.append(RandomNumberOne)
        labelsList.append(RandomNumberTwo)
        labelsList.append(RandomNumberThree)
    }

    @IBAction func SliderForRandomNumbers(_ sender: UISlider) {
        let randNumOne = Float.random(in: 0...sender.value)
        let randNumTwo = Float.random(in: 0...sender.value)
        let randNumThree = Float.random(in: 0...sender.value)

        RandomNumberOne.text = String(randNumOne.rounded())
        RandomNumberTwo.text = String(randNumTwo.rounded())
        RandomNumberThree.text = String(randNumThree.rounded())
    }
    
    @IBAction func functionOnNums(_ sender: UIButton) {
        let randNumOne = Float(RandomNumberOne.text!)!
        let randNumTwo = Float(RandomNumberTwo.text!)!
        let randNumThree = Float(RandomNumberThree.text!)!

        if checkForFunctionWord.text == "sum" {
            let sumOfNums = randNumOne + randNumTwo + randNumThree
            ResultOfFUnction.text = String(sumOfNums)
        } else {
            if checkForFunctionWord.text == "average" {
                let sumOfNums = randNumOne + randNumTwo + randNumThree
                let average = sumOfNums / Float(labelsList.count)
                ResultOfFUnction.text = String(average.rounded())
            } else {
                if checkForFunctionWord.text == "maximum" {
                    if randNumOne > randNumTwo && randNumOne > randNumThree {
                        ResultOfFUnction.text = String(randNumOne.rounded())
                    } else if randNumTwo > randNumThree {
                        ResultOfFUnction.text = String(randNumTwo.rounded())
                    } else {
                        ResultOfFUnction.text = String(randNumThree.rounded())
                    }
                } else {
                        ResultOfFUnction.text = "Incorrect Input"
                }
            }
        }
    }
    
    
    
}
