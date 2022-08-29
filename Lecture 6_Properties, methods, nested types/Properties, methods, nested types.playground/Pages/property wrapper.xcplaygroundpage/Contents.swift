//: [Previous](@previous)

import Foundation

// შექმენით Person სტრუქტურა, რომელსაც ექნება ორი ცვლადი. სახელი და ასაკi
// შექმენი @propertyWrapper struct Capitalized და გამოიყენე.

@propertyWrapper struct Capitalized {
    var wrappedValue: String {
        willSet{
            print("🟢")
            wrappedValue = wrappedValue.capitalized
        }
    }
    
    init(wrappedValue: String) {
        print("🌕")
        self.wrappedValue = wrappedValue.capitalized
    }
}

struct Person {
    @Capitalized var name: String
    @Capitalized var surName: String

    var age: Int
}

var pers = Person(name: "pers1", surName: "ksdbvjds", age: 16)
print(pers.name)

pers.name = "sasfjajsfc"


//: [Next](@next)


