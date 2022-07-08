//: [Previous](@previous)

import Foundation
//შექმენით ახალი მასივი სადაც მოცემული იქნება დადებითი რიცხვები
let  allNumbers = [1,2,-3,4,-5,6,78,-9,0,10]

let positiveNumbers = allNumbers.filter { number in
    number > 0
}

let positiveNumbersShort = allNumbers.filter { $0 > 0 }
print(positiveNumbersShort)

//იპოვეთ ის მანქანები რომელთა სახელიც იქყება "M"
let cars = [
    (name: "Mercedes", price: 20000),
    (name: "BMW", price: 30000),
    (name: "Ferrari", price: 40000),
    (name: "Mazda", price: 50000),
]
print("aa \(cars)")

let filteredCars = cars.filter { car in
    (car.name.first ?? "n").uppercased() == "M" &&  car.price > 40000
}
print(filteredCars)

//იპოვეთ ის მანქანები რომელთა სახელიც იქყება "M" ზე და ფასი არის 40000 ზე მეტი




