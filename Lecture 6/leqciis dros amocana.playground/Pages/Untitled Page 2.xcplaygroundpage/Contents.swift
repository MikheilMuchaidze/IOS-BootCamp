//: [Previous](@previous)

import Foundation

@propertyWrapper struct Capitalized {
    var wrappedValue: String {
        didSet{
            wrappedValue = wrappedValue.capitalized
        }
    }
    
    init(wrappedValue: String) {
        self.wrappedValue = wrappedValue.capitalized
    }
}

struct Person {
    @Capitalized var name: String
    @Capitalized var surName: String

    var age: Int
}

let pers = Person(name: "pers1", surName: "ksdbvjds", age: 16)
print(pers.name)
