//
//  ViewController.swift
//  Muchaidze_Lecture_20
//
//  Created by Misha Muchaidze on 20220808...
//

import UIKit

class ViewController: UIViewController {
    
    //satestot 500 davayene magram ideashi imushavebs magal ricxvzec
    let numbers = 1...5_000
    
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
        calculatePrimeNumbers.isEnabled = false
//        calculatePrimeNumbers.setTitle("please wait!", for: .normal)

        DispatchQueue.global(qos: .background).async {
            
            for i in self.numbers {
                let testList = self.primeNums(limit: i)
                
                var primeList = [Int]()
                
                if testList.count == 2 {
                    primeList.append(i)
                }
                
                primeList.forEach { elem in
                    print(elem, terminator: " ")
                }
            }
            
            DispatchQueue.main.async {
                self.indicator.stopAnimating()
                self.indicator.isHidden = true
                self.calculatePrimeNumbers.isEnabled = true
            }
    
        }
    
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

