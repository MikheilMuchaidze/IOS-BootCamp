import Foundation

let allCars = [
Car(manufacturer: "name1", model: "model1", price: 100),
Car(manufacturer: "name2", model: "model2", price: 1000),
Car(manufacturer: "name3", model: "model3", price: 200),
Car(manufacturer: "name4", model: "33", price: 500),
Car(manufacturer: "name3", model: "3434", price: 200),
Car(manufacturer: "name4", model: "34", price: 500)
]

let sss = allCars.filter { name in
    name = allCars.
}

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

