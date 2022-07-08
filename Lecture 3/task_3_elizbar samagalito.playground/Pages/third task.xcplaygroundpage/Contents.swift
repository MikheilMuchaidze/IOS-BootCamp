
import Foundation

//   დაითვალეთ მასივში არსებული სტრინგებიდან რამდენია პალინდრომი. პალინდრომი არის ტექსტი, რომელიც ორივე მხრიდან ერთნაირად იკითხება.
//(მაგ.: let array = [“ABA”, “AKKA”, “0101”] ამ მასივში არის ორი პალინდრომი, “ABA” და “AKKA”).

func checkForPalindrome(stringArray x: [String]) {
    var palindroms = [String]()
    for index in 0..<x.count {
        if x[index].lowercased() == String(x[index].reversed()).lowercased() {
            palindroms.append(x[index])
        }
    }
    print(" ამ მასივშ არის \(palindroms.count) პალინდრომი და ესენია - ")
    for item in palindroms {print(item,terminator: " ")}
}

print(checkForPalindrome(stringArray:["AbBa","5005","gio","ragac","BAAB"]))
