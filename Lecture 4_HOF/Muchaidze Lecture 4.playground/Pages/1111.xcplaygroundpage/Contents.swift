import UIKit
import PlaygroundSupport

//anbanis sia
let alphabet = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
//ricxvebis masivis sheqmna da gamotana
let listSize = 5
let low = 1
let high = 30
var arrayOfInts = (0..<listSize).map { _ in
    Int.random(in: low...high)
}
print(arrayOfInts)

