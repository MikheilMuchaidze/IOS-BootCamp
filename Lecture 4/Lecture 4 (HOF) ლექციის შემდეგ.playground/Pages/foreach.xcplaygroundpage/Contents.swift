//: [Previous](@previous)

import Foundation

let allNumbers = [1,2,-3,4,-5,6,78,-9,-90,10]

//დაბეჭდე თითოეული მეტია თუ არა ნულზე

allNumbers.forEach { number in
    print(number)
}
print("--------")
for number in allNumbers where number > 60 {
    print(number)
}

/*:
 for თუ foreach
 */

//: [Next](@next)
