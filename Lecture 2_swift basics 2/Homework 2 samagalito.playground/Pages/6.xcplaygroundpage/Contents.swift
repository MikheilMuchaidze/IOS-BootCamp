import Cocoa

var randomNums = [Int]()
var numberOccurence = [Int : Int]()
var maxNumberCount = 0
var maxNumber = 0

for i in 0...9 {
    randomNums.append(Int.random(in: 1...10))

    numberOccurence[randomNums[i]] = (numberOccurence[randomNums[i]] ?? 0 ) + 1

    if numberOccurence[randomNums[i]]! > maxNumberCount {
        maxNumberCount = numberOccurence[randomNums[i]]!
        maxNumber = randomNums[i]
    }
}

print("Random nums: \(randomNums)")
print("Keys in dictionary \(numberOccurence.keys)")
print("Values in dictionary \(numberOccurence.values)")
print("Number with the most occurence is \(maxNumber) ")
















