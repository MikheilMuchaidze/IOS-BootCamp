import UIKit
import PlaygroundSupport
import Darwin

//arrays gamocxadeba
var firstList = [Int]()
var secondList = [Int]()
//arrays shevseba
for _ in 0...9{
    firstList.append(Int.random(in: 0...30))
    secondList.append(Int.random(in: 0...30))
}
//arrais chveneba
print("sawyisi pirveli masivi \(firstList)")
print("sawyisi pirveli masivi \(secondList)")
//closures sheqmna arraize samushaod
let joinedListsClosure = { (listOne: [Int], listTwo: [Int]) -> [Int] in
    let sumOfTwo = listOne + listTwo
    return sumOfTwo
}
func joinListsWithClosure(pirveliSia: [Int], meoreSia: [Int], closure: ([Int], [Int]) -> [Int]) -> [Int]{
    let valueForResult = closure(pirveliSia, meoreSia)
    return valueForResult
}

let fromClosure = joinListsWithClosure(pirveliSia: firstList, meoreSia: secondList, closure: joinedListsClosure)
print("am masivebis gaertianeba = \(fromClosure)")

