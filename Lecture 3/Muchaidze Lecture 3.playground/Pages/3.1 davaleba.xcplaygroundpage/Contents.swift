import UIKit
import PlaygroundSupport
import Darwin

//arrays gamocxadeba
var startList = ["ABBa", "CBB4", "1221", "s3s4", "Kiik", "BILI", "1221"]
//arrais chveneba
print("sawyisi pirveli masivi \(startList)")
//funcsiis sheqmna arraize samushaod
func checkForPalindormeFrom(list: [String]){
    var palindrome = [String]()
    for n in 0...list.count-1{
        if list[n].lowercased() == String(list[n].reversed()).lowercased(){
            palindrome.append(list[n])
        }
    }
    print("am masivshi aris \(palindrome.count) palindromi romllebicaa:")
    for elements in palindrome{
        print(elements, terminator: " ")
    }
}
//punqciis gamoyeneba da polindromebis dabechdva
checkForPalindormeFrom(list: startList)
