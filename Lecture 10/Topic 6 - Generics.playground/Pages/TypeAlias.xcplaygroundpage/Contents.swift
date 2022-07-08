//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//რა არის typealias

//შექმენით ადამიანის მონაცემების typealias
typealias Name = String
typealias LastName = String

//შექმენით ფუნქცია printPersonInfo
func printPersonInfo(name: Name, lastName: LastName) {
    print("name is \(name), lastName is \(lastName)")
}
printPersonInfo(name: "Giorgi", lastName: "Giorgadze")

var someName: Name = "David"
var testVar = "ssss "
extension Name {
    var dublicated: String {
        self+self
    }
}
someName.dublicated
testVar.dublicated

//შექმენით typealias კოორდინატისთვის
typealias Coordinate = (grdzedi: Double,ganedi: Double)
var locationOfTbilisi: Coordinate = (44.43, 45.43)
locationOfTbilisi.ganedi
locationOfTbilisi.1

//შექმენით closure - is typealias

typealias Completion = () -> Void

func makeSomeAction(completion: Completion) {
    completion()
}

makeSomeAction {
    print("🌕")
}

typealias BooleanCompletion = (Bool) -> Void

func makeSomeAction_1(completion: BooleanCompletion) {
    completion(Bool.random())
}

makeSomeAction_1 { bool in
    print("🌕 \(bool)")
}


//: [Next](@next)
