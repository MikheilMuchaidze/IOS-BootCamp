/*:
 [Previous](@previous)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Next](@next)
 
 # Composite
 - - - - - - - - - -
 ![Composite Diagram](Composite_Diagram.png)
 
 composite pattern აჯგუფებს **სხვადასხვა იერარქიაში** მყოფ ობიექტებს პროტოკოლის საშუალებით, რათა მათზე მანიპულირება ერთი განსაზღვრული გზით მოხდეს, როგორც ერთი ტიპის ობიექტებზე.
 
 -  component protocol
  უზრუნველყოფს ყველა ობიექტის ერთნაირად დამუშავების შესაძლებლობას.
 -  leaf არის კომპონენტი რომელიც ეთანხმება component პროტოკოლს,
 -  composite არის კონტეინერი რომელსაც უჭირავს leaf ობიექტები და რომელიც ეთანხმება component პროტოკოლს.
 
 */
import Foundation

protocol Movable {
    var name: String { get set }
    func move()
}

class Minivan: Movable {
    
    var name: String
    var seats = 6
    
    init(name: String) {
        self.name = name
    }
    
    func move() {
        print("Minivan is moving")
    }
}

class Cabrio: Movable {
    
    var name: String
    var isSuperCar: Bool
    
    init(name: String, isSuperCar: Bool) {
        self.name = name
        self.isSuperCar = isSuperCar
    }
    
    func move() {
        print("Cabrio is moving")
    }
}

class AutoTransporter: Movable {
    
    var name: String
    var autos: [Movable] = []
    
    init(name: String) {
        self.name = name
    }
    
    func load(auto: Movable) {
        self.autos.append(auto)
    }
    
    func move() {
        print("Transporter is moving")
    }
}

let cabrio = Cabrio(name: "Porsche", isSuperCar: true)
let volkswagen = Minivan(name: "VW")


let volvo = AutoTransporter(name: "Volvo")
volvo.load(auto: cabrio)
volvo.load(auto: volkswagen)
