import UIKit
import PlaygroundSupport
import Darwin

//anbanis sia
let alphabet = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
//axali masivis gamocxadeba, shevseba da bechdva
var newArray = [String]()

for _ in 0...30 {
    let randomAlphaberNumber = Int.random(in: 0...25)
    newArray.append(alphabet[randomAlphaberNumber])
}

print("axali masivi anbanidan \(newArray)")

let filteredArray = newArray.filter { letterD in
    letterD != "D"
}.filter { letterE in
    letterE != "E"
}.filter { letterQ in
    letterQ != "Q"
}

print("gapiltruli masivi D, E da Q asoebisgan\(filteredArray)")

let checkArrayForC = filteredArray.filter { letterIsC in
    letterIsC.contains("C")
}.compactMap { checkForTrue in
    checkForTrue == "C"
}

print(checkArrayForC)


