import UIKit
import PlaygroundSupport
defer { PlaygroundPage.current.finishExecution() }

let startArr = [1, 7, 12, 15, 7, 13, 5, 7, 9, 12, 23, 7]

print("sawyisi masivi = \(startArr)")
/*
var newArr = Set<Int>()

for i in 0...startArr.count-1{
    newArr.update(with: startArr[i])
}
    
print("axali masivi = \(newArr)")
let unicNum = newArr.count

print("unikaluri ricxvebia \(unicNum)")
*/

var newSet = Set(startArr)

print("unikaluri ricxvebia \(newSet)")

var newSetCharCount = newSet.count

print("unikaluri ricxvebis raodenbaa \(newSetCharCount)")




