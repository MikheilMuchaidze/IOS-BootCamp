import UIKit
import PlaygroundSupport

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
//funcsiis sheqmna arraize samushaod returnis gareshe
func searchIntersectionIn(listOne: [Int], listTwo: [Int]){
    let newSetFromArrayOne = Set(listOne)
    let newSetFromArrayTwo = Set(listTwo)
    let intersected = newSetFromArrayOne.intersection(newSetFromArrayTwo)
    print("tanakvetashi moxvda shemdegi ricxvebi \(intersected)")
}
//funqciis gamodzageba
searchIntersectionIn(listOne: firstList, listTwo: secondList)
print("")
//funqciis sheqmna returnis gamoyenebit
func searchIntersectionWithReturnIn(listOne: [Int], listTwo: [Int]) -> Set<Int>{
    let newSetFromArrayOne = Set(listOne)
    let newSetFromArrayTwo = Set(listTwo)
    let intersected = newSetFromArrayOne.intersection(newSetFromArrayTwo)
    return intersected
}
//funqciis gamodzaxeba da bechdva
let punqicaReturnidan = searchIntersectionWithReturnIn(listOne: firstList, listTwo: secondList)
print("returniani punqiccs shedegad tanakvetashi moxvda es ricxvebi \(punqicaReturnidan)")
