//: [Previous](@previous)

import Foundation

let  allNumbers = [1,2,-3,4,-5,6,78,-9,0,10]

//გაიგეთ მასივი შეიცავს თუ არა რიცხვ 7
allNumbers.contains(7)


//გაიგეთ შეიცავს თუ არა 7 ის ჯერად რიცხვს
allNumbers.contains { number in
    number.isMultiple(of: 7)
}


//თუ მანქანის ფასი არის 100000 ზე მეტი ე.ი. ეს მანქანა არის სუპერმანქანა. გაიგეთ არის თუ არა ამ მასივში ასეთი
let cars = [
    (name: "Mercedes", price: 20000),
    (name: "BMW", price: 30000),
    (name: "Ferrari", price: 40000),
    (name: "Mazda", price: 500000),
]

let k = cars.contains { car in
    car.price > 100_000
}
print(k)

//: [Next](@next)
