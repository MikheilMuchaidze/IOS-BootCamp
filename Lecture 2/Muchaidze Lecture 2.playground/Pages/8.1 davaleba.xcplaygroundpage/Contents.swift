import UIKit
import PlaygroundSupport
defer { PlaygroundPage.current.finishExecution() }

var randomNum = Int.random(in: 1...1000000)

print("tqveni ricxvia = \(randomNum)")

var numIntoString: String = "\(randomNum)"

print("ricxvi stringis saxit = \(numIntoString)")

print("ciprebis raodenoba = \(numIntoString.count)")

//meore metodi
var countOfNums = 0
while randomNum > 0 {
    countOfNums += 1
    randomNum /= 10
}

print("ciprebis raodenoba meore metodit = \(countOfNums)")



