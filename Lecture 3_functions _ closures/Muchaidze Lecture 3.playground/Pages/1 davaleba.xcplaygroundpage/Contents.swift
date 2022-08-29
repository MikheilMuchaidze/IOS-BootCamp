import UIKit
import PlaygroundSupport

//arrays gamocxadeba
var list = [Int]()
//arrays shevseba
for _ in 0...19{
    list.append(Int.random(in: 0...30))
}
//arrais chveneba
print("sawyisi masivi \(list)")
//funcsiis sheqmna arraize samushaod
func searchSimilarIn(list: [Int]) -> Int {
    let newSetFromArray = Set(list)
    let count = newSetFromArray.count
    return count
}
//funqciis gamodzageba
var listCount = searchSimilarIn(list: list)
print("am siashi \(listCount) gansxvavebuli elementia")

//meore metodit
func searchUniqueNumberIn(list: [Int]) -> Int{
    Set(list).count
}

var listtwo = [Int]()
//arrays shevseba
for _ in 0...19{
    listtwo.append(Int.random(in: 0...30))
}
//arrais chveneba
print("sawyisi masivi \(listtwo)")
print("meore masivis unikaluri elemnetebis ricxvia \(searchUniqueNumberIn(list: listtwo))")

