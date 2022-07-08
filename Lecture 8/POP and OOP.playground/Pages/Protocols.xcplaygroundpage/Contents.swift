//: [Previous](@previous)

import UIKit
import Foundation

var greeting = "Hello, playground"

/*
 შექმენით პროტოკოლი Flyable, რომელსაც გააჩნია
 ცვლადი currentSpeed
 ცვლადი maxSpeed
 ცვლადი isSpiritual
 ფუნქცია increaseSpeed
*/
protocol Flyable {
    var currentSpeed: Double  { get set }
    var maxSpeed: Double { get set }
    var isSpiritual: Bool  { get set }
    mutating func increaseSpeed()
    init(currentSpeed: Double)
}

/*
შექმენით კლასი Bird, რომელიც მიიღებს პროტოკოლ Flyable-ს
ასევე ექნება name
 შექმენით ჩიტის ობიექტი და გამოიძახეთ increaseSpeed მეთოდი.
 */

class Bird: Flyable {
    var currentSpeed: Double = 0.0
    var maxSpeed: Double
    var isSpiritual: Bool = false

    var name: String
    
    init(name: String, currentSpeed: Double, maxSpeed: Double, isSpiritual: Bool) {
        self.name = name
        self.currentSpeed = currentSpeed
        self.maxSpeed = maxSpeed
        self.isSpiritual = isSpiritual
    }
    
    required init(currentSpeed: Double) {
        self.name = "name"
        self.currentSpeed = currentSpeed
    }
    
    func increaseSpeed() {
        if currentSpeed < maxSpeed - 2 {
            currentSpeed+=2
        }
    }
}

class Soooo: Bird {
    
    func ssss() {
        self.
    }
}


let bird1 = Bird(name: "swallow", currentSpeed: 12, maxSpeed: 30, isSpiritual: true)
bird1.currentSpeed
bird1.increaseSpeed()
bird1.currentSpeed



/*
 protocol Flyable ში დაამატეთ ინიციალიზაციის ფუნქცია
 */


/*
 შექმენით ვერტმფრენის სტრუქტურა რომელიც მიიღებს Flyable პროტოკოლს, შექმენით მისი instance
 */

struct Helicopter: Flyable {
    var currentSpeed: Double = 0
    
    var maxSpeed: Double = 0
    
    var isSpiritual: Bool = false
    
    mutating func increaseSpeed() {
        currentSpeed+=15
    }
    
    init(currentSpeed: Double) {
        self.currentSpeed = currentSpeed
    }
    
    init(){
        self.currentSpeed = 25
    }
}

protocol Flyable1 {
    init(currentSpeed: Double,name: String)
}

struct SomeNewStruct1: Flyable1 {
    var name: String
    var currentSpeed: Double
}


/*
 მოათავსეთ ჩიტის  და ვერტმფრენის მასივში და დაბეჭდეთ ორივეს მაქსიმალური სისწრაფე.
 */
var helicopter1 = Helicopter()

var allFlyable: [Flyable] = [
    helicopter1,
    bird1
]

/*
 შექმენით მასივის extension ფუნქციით printCurrentAndMaxSpeed() მაშინ როცა ელემენტი არის Flyable.
 */
extension Array where Element == Flyable {
    func printCurrentAndMaxSpeed() {
        self.forEach { item in
            print(item.maxSpeed,item.currentSpeed)
        }
    }
}

allFlyable.printCurrentAndMaxSpeed()

/*
 შექმენით 2 protocol და გააერთიანე.
 */

protocol Eatable {
    var calories: Int { get set }
}

protocol Saleable {
    var price: Int { get set }
}

protocol CombinedProtocol: Eatable, Saleable {
    var name: String { get }
}

typealias CombinedProtocol1 = Eatable & Saleable
 

struct SomeNewStruct {}

extension Flyable {
    
    func increaseSpeed() {
        print("🌕")
    }
}

/*
 შექმენით რომელიმე protocol ის Extension
 */

/*
 შექმენით protocol ასოცირებული ტიპით
 */

protocol SomeProtocol2 {
    associatedtype x
    associatedtype y
    var items: [x] { get set }
}
class SomeClaasForAssociatedtype: SomeProtocol2 {
    var items: [Int] = []
}

class SomeClaasForAssociatedtype1: SomeProtocol2 {
    var items: [Double] = []
}
