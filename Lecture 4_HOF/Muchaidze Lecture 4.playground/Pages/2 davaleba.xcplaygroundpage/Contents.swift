import UIKit
import PlaygroundSupport

//anbanis sia
let alphabet = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
print(alphabet.count)
var randomNumsArray = [15, 4, 6, 22, 17]
/*var randomNumsArray = [Int]()
for _ in 1...5 {
    randomNumsArray.append(Int.random(in: 1...30))
}*/

print("shemtxveviti ricvxvebi masivi\(randomNumsArray)")

let StringsFromAlphabetByNumber = randomNumsArray.map { number -> [String] in
    var returningString = [String]()
    let checkIndex = number - 1 < alphabet.count ? number - 1 : Int.random(in: 0...alphabet.count)
    for _ in 0..<number {
        returningString.append(alphabet[checkIndex])
    }
    return returningString
}

print(StringsFromAlphabetByNumber)
print(" ")

let SortedString = Set(StringsFromAlphabetByNumber.flatMap { element in
    element
}).sorted { left, right in
    left < right
}

print(SortedString)
