//: [Previous](@previous)

import UIKit
import Foundation
import PlaygroundSupport
defer { PlaygroundPage.current.finishExecution() }

/*:
 switch statement
 */
let numberForCheck = 1

switch numberForCheck {
case 0,3:
    print("3 or 4")
case 4:
    print("five")
default:
    print("other number")
}
//: [Next](@next)
