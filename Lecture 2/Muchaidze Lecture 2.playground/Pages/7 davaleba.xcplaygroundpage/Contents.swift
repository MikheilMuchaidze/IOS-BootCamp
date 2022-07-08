import UIKit
import PlaygroundSupport
defer { PlaygroundPage.current.finishExecution() }

let ranNum1 = Int.random(in: 1...100)
let ranNum2 = Int.random(in: 1...100)

var sumNum1 = 0
var sumNum2 = 0

for testNum1 in 1...ranNum1{
    if ranNum1 % testNum1 == 0{
        sumNum1 = sumNum1 + testNum1
    }
}

for testNum2 in 1...ranNum2{
    if ranNum2 % testNum2 == 0{
        sumNum2 = sumNum2 + testNum2
    }
}

print("pirveli ricxxvi = \(ranNum1)")
print("\(ranNum1) ricxvis gamyopebis jami = \(sumNum1)")
print("meore ricxvi = \(ranNum2)")
print("\(ranNum2) ricxvis gamyopebis jami = \(sumNum2)")

let gamyopebiJamiTest = sumNum1 > sumNum2 ? ranNum1: ranNum2

print("am ricxvebidan udidesi gamyopi aqvs - \(gamyopebiJamiTest)")


