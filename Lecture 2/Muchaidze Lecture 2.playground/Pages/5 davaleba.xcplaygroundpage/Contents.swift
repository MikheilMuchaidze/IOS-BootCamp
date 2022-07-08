import UIKit
import PlaygroundSupport
defer { PlaygroundPage.current.finishExecution() }

let names = ["gela", "zaira", "shalva", "muradi", "mayvala"]
var grades = [Int]()
let namesIndexes = names.count-1
for _ in 0...4{
    grades.append(Int.random(in: 1...100))
}

var results = [String: Int]()
var maxGrade = 0
var nameWithMaxGrade = String()

for n in 0...names.count-1{
    results[names[n]] = grades[namesIndexes-n]
    if grades[namesIndexes-n] > maxGrade{
        maxGrade = grades[namesIndexes-n]
        nameWithMaxGrade = names[n]
    }
}

print(results)
print("umaglesi qula miigo - \(nameWithMaxGrade)")


