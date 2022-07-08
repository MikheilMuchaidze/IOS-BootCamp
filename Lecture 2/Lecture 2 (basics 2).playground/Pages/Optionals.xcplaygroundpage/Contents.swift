//: [👈 Introduction](@previous)                                                [Functions 👉](@next)
import Foundation
import PlaygroundSupport
defer { PlaygroundPage.current.finishExecution() }
/*:
   - ✅ Introducing optionals
   - ✅ Unwrapping an optional
   - optional binding if let/guard let
   - ✅ nil coalescing operator
 ---
 */


result(for: "optional binding if let/guard let") {
    var arrayOfNumbers: [Int] = [1,2,3,4,5,6,7]
  
    arrayOfNumbers.removeAll()
    print(arrayOfNumbers)
    
    let firstElement = arrayOfNumbers.first
    let text = "88"
    arrayOfNumbers.removeAll()
    
    if let first = arrayOfNumbers.first,
       let intValue = Int(text) {
        print("first element in array is \(first)")
    } else {
        print(" if 🔴")
    }

    arrayOfNumbers.append(contentsOf: [3,1,2])
    guard let firstUsingGuard = arrayOfNumbers.first,
          let intValue = Int(text) else {
        print("guard 🔴")
        return
    }
    
    print(firstUsingGuard)

    guard let intValue = Int(text) else {
        print("guard 🌕")
        return
    }
    print(intValue)
}

//: [👈 Introduction](@previous)                                                [Functions 👉](@next)
