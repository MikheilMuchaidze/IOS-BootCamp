import UIKit


// შექმენით კლასი მანქანა რომელსაც ექნება ცვლადი ფასი, საწყისი ფასი, და 3 მეთოდი: ფასის მომატება, ფასის დაკლება, საწყისი ფასის გატოლება და მიმდინარე ფასის ბეჭდვა.

class Car {
    
    let manufacturer: String
    let startPrice: Int
    var price: Int {
        willSet {
            print("🔴")
        }
    }
    
    init(manufacturer: String, currentPrice: Int) {
        self.manufacturer = manufacturer
        self.startPrice = currentPrice
        self.price = currentPrice
    }
    
    func addPrice(by price: Int) {
        self.price += price
    }
    
    func minusPrice(by price: Int) {
        self.price -= price
    }
    
    func resetPrice() {
        price = startPrice
    }
    
    func printCurrentPrice() {
        print("current price of \(manufacturer) is \(price)")
    }
}

let newCar = Car(manufacturer: "Mercedes", currentPrice: 20_000)
newCar.printCurrentPrice()
newCar.addPrice(by: 10000)
newCar.printCurrentPrice()
newCar.resetPrice()



newCar.printCurrentPrice()
