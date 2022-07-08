//: [Previous](@previous)
//reduce
import Foundation
//იპოვეთ ყველა ელეემტის ჯამი
var allNumbers = [1,2,3,4,5,6,7,8]

let duplicated = allNumbers.map { number in
    number*2
}
let duplicated1 = allNumbers.map { $0*2 }

duplicated

let sumOfAllNumbers1 = allNumbers.reduce(5) { $0 + $1 }
let sumOfAllNumbers = allNumbers.reduce(5) { currentSum, number in
    currentSum + number
}


var allNumbers1 = [[1,2,3,4,5,6,7,8],[1,2,3]]
let merged = allNumbers1.flatMap { $0 }.reduce(0, +)

print(merged)


//იპოვეთ ყველა მანქანის ფასი
let cars = [
    (name: "Mercedes", price: 20000),
    (name: "BMW", price: 30000),
    (name: "Ferrari", price: 40000),
    (name: "Mazda", price: 50000),
    (name: "Mazda1", price: 70000),
]

let priceOfAllCars = cars.reduce(0) { partialResult, car in
    car.price > 40000 ? partialResult + car.price : partialResult
}
print(priceOfAllCars)

let priceOfAllCars1 = cars.filter { car in
    car.price > 40000
}.reduce(0) { partialResult, car in
    partialResult + car.price
}

print(priceOfAllCars)

//იპოვეთ ყველა მანქანის ფასი რომელიც მეტია 40000

//: [Next](@next)
