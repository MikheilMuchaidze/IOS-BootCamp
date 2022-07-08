//: [Previous](@previous)

import Foundation

/*
 შექმენით აბსტრაქტული კლასი ცხოველი, რომელსაც ექნება
 * ცვლადი isDomestic
 * მეთოდი რომელიც არის ხმის გამოცემა
 * convenience init() isDomestic -> false
 */



class Animal {
    let isDomestic: Bool
    
    init(isDomestic: Bool) {
        self.isDomestic = isDomestic
    }
    
    func makeNoise() {
        fatalError("es aekbdvkjdv")
    }
    
    convenience init() {
        self.init(isDomestic: false)
    }
}

let wolf = Animal(isDomestic: false)
let lion = Animal()

//wolf.makeNoise()

/*
 შექმენით Animal კლასის შვილობილი კატის კლასი, რომელსაც აქვს
* ცვლადი ბეწვის სიგრძე hairLength
* გამოთვლადი ცვლადი არის თუ არა გძელბეწვიანი (hasLongHair) > 10
* გამოსცემს ხმას. "miaw"
* შეუქმენით convenience init() hairLength: 11
* შექმენით კატის ცვლადი და დაბეჭდეთ მისი isDomestic მნიშვნელობა და გამოიძახეთ makeNoise მეთოდი
 */

class Cat: Animal {
    var hairLength: Double
    var hasLongHair: Bool { hairLength > 10 }
    
    init(hairLength: Double) {
        self.hairLength = hairLength
        super.init(isDomestic: true)
    }
    
    convenience init() {
        self.init(hairLength: 11)
    }
    
    override func makeNoise() {
        print("miaw i am \(Self.self)")
    }
}
let cat1 = Cat()
cat1.makeNoise()


/*
 შექმენით Animal კლასის შვილობილი ძაღლის კლასი,
 * რომელსაც აქვს ცვლადი isOld
 * რომელიც გამოსცემს ხმას "waf"
*/

class Dog: Animal {
    var isOld: Bool
    var someVariable: String { "some from Dog" }
    init(isOld: Bool) {
        self.isOld = isOld
        super.init(isDomestic: true)
    }
    
    override func makeNoise() {
        print("waf i am \(Self.self)")
    }
}


let dog1 = Dog(isOld: true)
dog1.makeNoise()

/*
 შექმენით ძაღლის შვილობილი კლასი hunterDog
 * რომელსაც აქვს დამატებით ცვლადი huntingLevel (enum)
 * მეთოდი makeNoise პარამეტრით noise
 */

class HunterDog: Dog {
    
    enum HuntingLevel {
        case beginer
        case medium
        case advanced
    }
     
    var huntingLevel: HuntingLevel
    
    override var someVariable: String { "some from HunterDog" }

    init(huntingLevel: HuntingLevel) {
        self.huntingLevel = huntingLevel
        super.init(isOld: false)
    }
//
//    override func makeNoise() {
//        print("voice of \(Self.self)")
//    }
}

let hunter1 = HunterDog(huntingLevel: .advanced)
hunter1.makeNoise()


/*
 შექმენით Cat Dog HunterDog ის ინსტანსები და მოათავსეთ ერთ მასივში
 */


print("---------------------")
let allAnimal = [
    cat1,
    dog1,
    hunter1
]

for animal in allAnimal {
    if let cat = animal as? Cat {
        print(cat.hasLongHair)
    }
}


/*
 ⚠️ overriding extension ში ვერ გავა
 ⚠️ convenience init() ის overriding არ შეიძლება
 ⚠️ stored properties ის overriding არ შეიძლება
 ⚠️ open access control აუცილებელია იმისთვის რომ მოხდეს სხვა მოდულიდან კლასის მშობლად გამოყენება.
 ⚠️ final class ის გამოყენებით შვილობილი კლასის შექმნა შეუძლებელია.
 */
