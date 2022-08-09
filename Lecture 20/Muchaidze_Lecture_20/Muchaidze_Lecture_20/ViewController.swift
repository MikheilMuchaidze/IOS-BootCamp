//
//  ViewController.swift
//  Muchaidze_Lecture_20
//
//  Created by Misha Muchaidze on 20220808...
//

import UIKit

class ViewController: UIViewController {
    
    let numbers = 1...10_000
    
    @IBOutlet weak var datePickerOutlet: UIDatePicker!
    
    @IBOutlet weak var calculatePrimeNumbers: UIButton!
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        indicator.isHidden = true
        
        
    }

    @IBAction func calculatePrimeNumbersBtn(_ sender: Any) {
        indicator.isHidden = false
        indicator.startAnimating()
        
        for i in numbers {
            let testList = primeNums(limit: i)
            
            var primeList = [Int]()
            
            if testList.count == 2 {
                primeList.append(i)
            }
            
            primeList.forEach { elem in
                print(elem, terminator: " ")
            }
        }
        
        indicator.stopAnimating()
        indicator.isHidden = true
    }
    
    func primeNums(limit: Int) -> [Int] {
        var list = [Int]()
        
        for i in 1 ... limit {
            if limit % i == 0 {
                list.append(i)
            }
        }
        
        return list
    }
    
    
}

