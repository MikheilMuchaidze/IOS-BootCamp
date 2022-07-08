
/*:
 # Properties
 - Stored Properties
 - Lazy Stored Properties
 - Computed Properties
 - static Properties
 - property observers

 */


import Foundation

// - Stored Properties


// - Computed Properties (read only)
// შექმენით გამოთვლადი ცვლადი fullDescription რომელიც დაბეჭდავს: price of ------ is ----- $"

//class CartItem {
//    let name: String
//    var price: Double
//    var fullDescription: String {
////        print("price of \(name) is \(price) $")
//        return "price of \(name) is \(price) $"
//    }
//
//    init(name: String, price: Double) {
//        self.name = name
//        self.price = price
//    }
//}
//
//let banana = CartItem(name: "Banana", price: 1.7)
//let apple = CartItem(name: "apple", price: 0.9)
//let decr = apple.fullDescription


// - computed Properties - read/write ....
class Square {
    var width: Double
    var height: Double
    
    var area: Double {
        get {
            width*height
        }
        set {
            width = newValue.squareRoot()
            height = newValue.squareRoot()
        }
    }
    
    init(width: Double, height: Double) {
        self.width = width
        self.height = height
    }
}


var square1 = Square(width: 12, height: 22)
square1.height
square1.width
square1.area


//square1.area = 25
square1.height
square1.width




func getDummyCalories()-> Int {
    var tempArray = [Int]()
    for i in 0...5_000 {
        let k = i*i
        tempArray.append(k)
    }
    return Int.random(in: 1...200_000)
}



// - lazy Properties
// შექმენით stored ცვლადი calories რომელიც გამოიყენებს getDummyCalories ფუნქციას.
//stored vs computed vs lazy

//class CartItem {
//    let name: String
//    var price: Double
//
//    var fullDescription: String {
////        print("price of \(name) is \(price) $")
//        return "price of \(name) is \(price) $"
//    }
//
//    lazy var calories = getDummyCalories()
//
//    init(name: String, price: Double) {
//        self.name = name
//        self.price = price
//    }
//}

//print(Date())
////let banana = CartItem(name: "Banana", price: 1.7)
//print(Date())
//banana.calories
//
//print(Date())
//banana.calories



// - static Properties
// შექმენით static ცვლადი measurement რომელიც აღწერს პროდუქტის წონის საზომ ერთეულს.

class CartItem {
    static let measurement = "KG."
    
    let name: String
    var price: Double

    var fullDescription: String {
//        print("price of \(name) is \(price) $")
        return "price of \(name) is \(price) $"
    }

    lazy var calories = getDummyCalories()

    init(name: String, price: Double) {
        self.name = name
        self.price = price
    }
}

//print("პროდუქტის საზომეი ერთეული არის \(CartItem.measurement)")

//- property observers
// შექმენით კლასი მოთამაშე, რომელსაც ექნება ცვლადი რეიტინგი,  რეიტინგის ცვლილება ასახული იყოს შესაბამისად



/*:
 >didSet - ის გამოძახებბა არ ხდება ინიციალური მნიშვნელობის მინიჭებისას
 */

class Player {
    
    var rating: Int = 0 {
        willSet {
            print("ახლანდელი მნიშვნელობა არის \(rating), ახალი მნიშვნელობა იქნება \(newValue)")
        }
        didSet {
            print("ძველი მნიშვნელობა იყო \(oldValue), ხოლო ახალი მნიშვნელობა არის \(rating)")
        }
    }
    
    var name: String
    
    init(name: String) {
        self.name = name
    }
}


let somePlayer = Player(name: "Player 1")
somePlayer.rating = 7





//: [Next](@next)
