/*:
 [Previous](@previous)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Next](@next)
 
 # Factory
 - - - - - - - - - -
 ![Factory Diagram](Factory_Diagram.png)
 
  Factory pattern განსაზღვრავს ობიექტების შექმნის გზას, რომელიც დამოკიდებულია იმ მონაცემის ტიპზე რომლის მიხედვითც ხდება ობიექტის შექმნა, ორი კომპონენტი გააჩნია:
 
 -  "factory" - რომელიც ქმნის ობიექტებს .
 -  "products" - ობიექტები, რომლებიც იქმნებიან.
 
 */
import Foundation

 struct Car {
     let model: String
     let manufacturer: Manufacturer
     var price: UInt
    
     enum Manufacturer {
        case mercedes
        case bmw
        case ferrari
        case tesla
    }
}

 struct Counrty {
     let name: String
     let flag: String
     let continent: Continent
     let additionalInfo: String
    
     enum Continent {
        case europe
        case america
        case asia
    }
}

 struct CountryFactory {
    
     let otherInformation = "რაიმე ზოგადი ინფორმაცია"
    
     func createCountry(for car: Car) -> Counrty {
        let nameForModel: String
        let flagForModel: String
        let continentForModel: Counrty.Continent
        
        switch car.manufacturer {

        case .mercedes, .bmw:
            nameForModel        = "Germany"
            flagForModel        = "🇩🇪"
            continentForModel   = .europe
        case .ferrari:
            nameForModel        = "Italy"
            flagForModel        = "🇮🇹"
            continentForModel   = .europe
        case .tesla:
            nameForModel        = "USA"
            flagForModel        = "🇺🇸"
            continentForModel   = .america
        }
        
        return Counrty(
            name: nameForModel,
            flag: flagForModel,
            continent: continentForModel,
            additionalInfo: otherInformation
        )
    }
}

let factory = CountryFactory()

let car1 = Car(model: "W124", manufacturer: .mercedes, price: 10_000)
let car2 = Car(model: "F40", manufacturer: .ferrari, price: 11_000)
let car3 = Car(model: "model 3", manufacturer: .tesla, price: 12_000)


let country1 = factory.createCountry(for: car1)
let country2 = factory.createCountry(for: car2)
let country3 = factory.createCountry(for: car3)


print(country1.flag)
print(country2.flag)
print(country3.flag)
