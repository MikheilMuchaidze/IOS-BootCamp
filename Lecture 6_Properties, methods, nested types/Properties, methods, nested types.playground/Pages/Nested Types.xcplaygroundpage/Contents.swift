//: [Previous](@previous)

import Foundation

class House {
    struct Place {
        let street: String
        let countyName: String
    }
    
    var numberOfDoors: Int = 0
    var place = Place(street: "assa", countyName: "Sasas")
}


class Planet {
    
    struct Place {
        let galaxy: Int
        var distanceFromEarth: Int
    }
    
    var place: Place?
}


var plac = House.Place.init(street: "asd", countyName: "ssss")
print(plac)
//: [Next](@next)
