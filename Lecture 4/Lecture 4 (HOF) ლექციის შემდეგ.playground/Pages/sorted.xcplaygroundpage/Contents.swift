//: [Previous](@previous)

import Foundation
//დაასორტირეთ მეტობით

//დაასორტირეთ ნაკლებობით
var allNumbers = [1,2,-3,4,-5,6,78,-9,-90,10]
allNumbers.sort()

allNumbers.sorted(by: <)


//დაასორტირეთ მეტობით

//დაასორტირეთ ნაკლებობით

var cars = [
    (name: "Mazda", price: 50000),
    (name: "Mercedes", price: 20000),
    (name: "BMW", price: 30000),
    (name: "Ferrari", price: 40000)
]
cars.sorted { first,second in
    print(first.name, "------",second.name)
    return first.price > second.price
}


//print(cars.sorted { $0.price > $1.price })
//print(cars.sorted { $0.price < $1.price })

cars.sort(by: >)

/*:
 განსხვავება sort სა და sorted ს შორის
 */


/*:
 - Callout(დაიმახსოვრეთ და გამოიყენეთ): შეგიძლიათ ეს ფუნქციები ერთმანეთის მიყოლებით გამოიყენოთ ჯაჭვურად.
 */


//: [Next](@next)
