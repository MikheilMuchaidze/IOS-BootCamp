//: [Previous](@previous)

import Foundation
import Darwin
import UIKit

var number = 100

for i in 1 ... number {
    if number % i == 0 {
        print(i, terminator: " ")
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


