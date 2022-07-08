//: [Previous](@previous)
import UIKit

//შექმენით მანქანის კლასი, რომელსაც ექნება 2 ცვლადი, manufacturer და model



//შექმენით designated initializer
//შექმენით ობიექტი
//ჩაამატეთ ფასი
class Car {
    let manufacturer: String
    var model: String = "z3"
    var price: Int
    
    init(manufacturer: String, model: String, price: Int) {
        print("🔴")
        self.manufacturer = manufacturer
        self.model = model
        self.price = price
    }
    
    convenience init(manufacturer: String, model: String) {
        print("🌕")
        self.init(manufacturer: manufacturer, model: model, price: 200)
    }
    
    func addPrice(amount: Int) {
        price += amount
    }
}



var firstCar = Car(manufacturer: "BMW", model: "x5")
print(firstCar.price)
firstCar.addPrice(amount: 100)


let secondCar = firstCar

firstCar.model = "new model"
print(secondCar.model)


print(firstCar.price)


//შექმენით convenience initializer
//შექმენით ობიექტი
//შექმენით ადამინაის კლასი failable initializer ის გამოყენებით.


class Person {
    let name: String
    var age: Int
    
    init?(name: String, age: Int) {
        self.name = name
        if age > 17 {
            self.age = age
        } else {
            return nil
        }
    }
}


let youngerPerson = Person(name: "name1", age: 15)
print(youngerPerson?.age)

/*:
 >Optional ან განსაზღვრულ ცვლადებს არ სჭირდება სავალდებულო ინიციალიზაცია
 */

//შექმენი მანქანების მასივი
//შექმენით ახალი კლასი "CheapCar" და map ფუნქციის გამოყენებით შეავსე ის უკვე შექმნილი მანქანების მასივისგან

class CheapCar {
    var price: Int
    
    init(price: Int) {
        self.price = price
    }
}


let allCars = [
Car(manufacturer: "name1", model: "model1", price: 100),
Car(manufacturer: "name2", model: "model2", price: 1000),
Car(manufacturer: "name3", model: "model3", price: 200),
Car(manufacturer: "name4", model: "33", price: 500),
Car(manufacturer: "name3", model: "3434", price: 200),
Car(manufacturer: "name4", model: "34", price: 500)
]


let cheapCars = allCars.compactMap { car -> CheapCar? in
    if car.price < 200 {
        return CheapCar(price: car.price)
    } else {
        return nil
    }
}

cheapCars.count


//: [Next](@next)
