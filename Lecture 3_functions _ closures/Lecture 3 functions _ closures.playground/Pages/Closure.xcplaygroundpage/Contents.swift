import UIKit
import Foundation
//import PlaygroundSupport
//defer { PlaygroundPage.current.finishExecution() }
/*:
 [👈 Functions](@previous)                [Home](introduction)
 # Closure
 

 */
/*:
   - რა არის Closure
 ---
 */

/*:
  * Important:
    * closure
    * as parameter
    * escaping
    * return from function
 ---
 */


/*
 გვაქვს ფუნქცია ბეჭდავს წინადადებას "SWIFT appeared 7 years ago"
 შექმენით იდენტური closure
 */

result(for: "SWIFT appeared 7 years ago") {
    func aboutSwift() {
        print("SWIFT appeared 7 years ago","🌕")
    }

    let aboutSwiftClosure = { print("SWIFT appeared 7 years ago","🌕") }
    
//    aboutSwift()
    aboutSwiftClosure()
}

/*
 გვაქვს პარამეტრიანი ფუნქცია რომელიც დაბეჭდავს თქვენს ჰობს.
 შექმენით იდენტური closure
 */

result(for: "თქვენი ჰობი") {
    let number = 7
    
    
    
    func myHobbyIs(_ hobby: String) {
        print("my hobby is \(hobby) 🌕")
    }
    myHobbyIs("basketball")
    
    let myHobbyClosure: (String)->() = { x in
        print("my hobby is \(x) 🌕")
    }
    myHobbyClosure("Soccer")
}

/*
გვაქვს ფუნქცია რომელიც აბრუნებს არის თუ არა ჩაწოდებული ორი პარამეტრი ერთმანეთის ტოლი
შექმენით იდენტური closure
 */
result(for: "ტოლობის შემოწმება") {
    func isNumbersEqual(number1: Int, number2: Int) -> Bool {
        number1 == number2
    }
    
    let isNumbersEqualClosure: (Int , Int) -> Void = { _,secondNumber in
        print(secondNumber)
    }
    
    isNumbersEqualClosure(7,7)
}


/*:
 # as parameter
 */
//შექმენით ამ ქლოჟერების პარამეტრად გამომყენებელი ფუნქცია
result(for: "როგორც პარამეტრი") {
    let halfValuePrinterClosure = { (number: Double) in
        print("half of \(number) is \(number/2) ")
    }
    
    let doubleValuePrinterClosure = { (number: Double) in
        print("Duplicated value of \(number) is \(number*2)")
    }
    
    func getInfoForNumber(number: Double, closure: (Double) -> ()) {
        closure(number)
    }
    
    getInfoForNumber(number: 7, closure: halfValuePrinterClosure)
    getInfoForNumber(number: 17, closure: doubleValuePrinterClosure)
    getInfoForNumber(number: 8) { number in
        print("🔴", number)
    }
}

/*:
 # escaping
 */
//MARK: - გამოიყენე წინა ამოცანა
result(for: "escaping closure") {
    let halfValuePrinterClosure = { (number: Double) in
        print("half of \(number) is \(number/2) ")
    }
    
    let doubleValuePrinterClosure = { (number: Double) in
        print("Duplicated value of \(number) is \(number*2)")
    }
    
    func getInfoForNumber(number: Double, closure: @escaping (Double) -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now()+3) {
            closure(number)
        }
        print("🔴🔴")
    }
    
    getInfoForNumber(number: 8, closure: halfValuePrinterClosure)
}

/*:
 # as returning Value / capturing
 */

//შექმენით ფუნქცია რომელიც აბრუნებს ქლოჟერს, რომელიც იღებს მთელ რიცხვს და აბრუნებს არაფერს. ..
result(for: "returning Closure") {
    func getSomeClosure() -> (Int) -> () {
        return { number in
            print("now printing - ", number)
        }
    }
    
    let closure = getSomeClosure()
    closure(6)
}



//შექმენით ფუნქცია რომელიც აბრუნებს ქლოჟერს, რომელიც არ იღებს პარამეტრს და აბრუნებს არაფერს. ..
result(for: "capturing Value (Timer)") {
    func getTimer()->()->() {
        var startvalue = 0
        
        return {
            startvalue += 1
            print(startvalue)
        }
    }
    
    let timer = getTimer()
//    for i in 0...5 {
//        DispatchQueue.main.asyncAfter(deadline: .now()+Double(i)) {
//            timer()
//        }
//    }
    timer()
    timer()
    timer()
}

result(for: "autoClosure") {
    func giveMeFiveWithClosure(execute: @autoclosure () -> Void) {
        execute()
    }

    giveMeFiveWithClosure(execute: print("👋"))
}
