import UIKit

//შექმენით მართკუთხედის კლასი რომელსაც ექნება სიგრძე და სიგანე, ასევე გამოთვლადი ცვლადი პერიმეტრი. (სიგრძის შეფარდება სიგანესთან არის 2:1).

class Rectangle {
    var width: Double
    var length: Double
    
    init (width: Double, length: Double) {
        self.width = width
        self.length = length
    }
    
    var perim: Double {
        get {
            2*(self.width+self.length)
        }
        set {
            self.width = (newValue*0.5) * 2/3
            self.length = (newValue*0.5) * 1/3
        }
    }
}

let r1 = Rectangle(width: 3.0, length: 4.0)
print(r1.perim)

r1.perim = 30.0
r1.perim = 40

print(r1.self.perim)
r1.perim = 30

print(r1.self.width)


