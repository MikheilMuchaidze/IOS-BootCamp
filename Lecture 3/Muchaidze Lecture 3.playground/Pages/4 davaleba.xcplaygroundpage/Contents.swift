import UIKit
import PlaygroundSupport
import Darwin

//arrays gamocxadeba
var firstList = [Int]()
var secondList = [Int]()
//arrays shevseba
for _ in 0...19{
    firstList.append(Int.random(in: 0...30))
    secondList.append(Int.random(in: 0...30))
}
//arrais chveneba
print("sawyisi pirveli masivi \(firstList)")
print("sawyisi pirveli masivi \(secondList)")
//closures sheqmna arraize samushaod
let joinedListsClosure = { (listOne: [Int], listTwo: [Int]) in
    let sum = listOne + listTwo
    print("joined list is \(sum)")
}
//joinedListsClosure(firstList, secondList)
func joinListsWithClosure(pirveliSia: [Int], meoreSia: [Int], closure: ([Int], [Int]) -> ()){
    closure(pirveliSia, meoreSia)
}
joinListsWithClosure(pirveliSia: firstList, meoreSia: secondList, closure: joinedListsClosure)
joinedListsClosure(<#T##[Int]#>, <#T##[Int]#>)
