import UIKit
import PlaygroundSupport
import Darwin

//arrays gamocxadeba
var startList = ["ABBa", "CBB4", "1221", "s3s4", "Kiik", "BILI", "123321"]
//arrais chveneba
print("sawyisi pirveli masivi \(startList)")
//funcsiis sheqmna arraize samushaod
func memberFrom(list: [String]) -> Int{
    var count = 0
    for n in 0...list.count-1{
        let listMember = list[n]
        let reversedListMember = String(listMember.reversed())
        if(listMember != "" && listMember == reversedListMember){
            count += 1
        }
    }
    return count
}
//punqciis gamoyeneba da polindromebis dabechdva
let polindromeCount = memberFrom(list: startList)
print("am masivshi polindromebis ricxvia = \(polindromeCount)")

//aqve mainteresebs amis chanaweri rogor iqneba tu zogi didi aso iqneba da zogi patara anu magalita abBA ??
