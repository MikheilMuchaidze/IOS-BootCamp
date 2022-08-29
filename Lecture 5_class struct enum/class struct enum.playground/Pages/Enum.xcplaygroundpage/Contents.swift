//: [Previous](@previous)

import Foundation

//შექმენით საწვავის ტიპის enum diesel და electro
//პირველ გვერდზე შექმნილი მანქანის კლასში გამოიყენეთ ეს ცვლადი

enum FuelType {
    case patrol(regularPrice: Double, premiumPrice: Int)
    case diesel(text: String)
    case electro
    case hybridc
}

class Car {
    let manufacturer: String
    var model: String = "z3"
    var price: Int
    var fuel: FuelType
    
    init(manufacturer: String, model: String, price: Int, fuel: FuelType) {
        self.manufacturer = manufacturer
        self.model = model
        self.price = price
        self.fuel = fuel
    }
    
    convenience init(manufacturer: String, model: String) {
        self.init(manufacturer: manufacturer, model: model, price: 200, fuel: .diesel(text: ",dshbcjds"))
    }
    
    func addPrice(amount: Int) {
        price += amount
    }
}

let newCar = Car(manufacturer: "dsdds", model: "dssdds", price: 112, fuel: .patrol(regularPrice: 8, premiumPrice: 9))
let aa = Car(manufacturer: "sss", model: "ddd", price: 22, fuel: .electro)
print(aa)

print(newCar)


//შექმენით ობიექტი და switch statement ის გამოყენებით დაბეჭდდეთ ინფორმაცია, "მანქანის საწვავის ტიპი არის დიზელი"
//rawValue
//ავტომატურად მინიჭბული მნიჭვნელობები
//ასოცირებული მნიშვნელობები (superPrice, regularPrice)

switch newCar.fuel {
    
case .patrol(regularPrice: _ , premiumPrice: let second):
    print(second)
default : break
    
}


//: [Next](@next)

