import Foundation
import UIKit

struct FuelExpences {
    let fuelCapacity: Int
    let fuelCunsumtion : Int
}
enum Brand {
    case BMW
    case Mersedes
    case Honda
    case Mazda
    case Toyota
}
class Car {
    let carBrand: Brand
    let carColor: String
    let carDoorCount: Int
    let fuel: FuelExpences
    
    init(carBrand: Brand, carColor: String, carDoorCount: Int, fuel: FuelExpences) {
        self.carBrand = carBrand
        self.carColor = carColor
        self.carDoorCount = carDoorCount
        self.fuel = fuel
    }
}
let CarList = [
    Car(carBrand: .BMW, carColor: "Red", carDoorCount: 4, fuel: .init(fuelCapacity: 50, fuelCunsumtion: 8)),
    Car(carBrand: .Mersedes, carColor: "Yellow", carDoorCount: 2, fuel: .init(fuelCapacity: 30, fuelCunsumtion: 4)),
    Car(carBrand: .Honda, carColor: "Green", carDoorCount: 3, fuel: .init(fuelCapacity: 40, fuelCunsumtion: 5)),
    Car(carBrand: .Honda, carColor: "Black", carDoorCount: 4, fuel: .init(fuelCapacity: 55, fuelCunsumtion: 3)),
    Car(carBrand: .Toyota, carColor: "White", carDoorCount: 4, fuel: .init(fuelCapacity: 25, fuelCunsumtion: 22)),
    Car(carBrand: .Mazda, carColor: "Black", carDoorCount: 2, fuel: .init(fuelCapacity: 24, fuelCunsumtion: 56)),
    Car(carBrand: .Mersedes, carColor: "White", carDoorCount: 4, fuel: .init(fuelCapacity: 30, fuelCunsumtion: 23)),
    Car(carBrand: .Toyota, carColor: "Yellow", carDoorCount: 2, fuel: .init(fuelCapacity: 35, fuelCunsumtion: 5)),
    Car(carBrand: .Mazda, carColor: "Yellow", carDoorCount: 4, fuel: .init(fuelCapacity: 60, fuelCunsumtion: 6)),
    Car(carBrand: .Mersedes, carColor: "Green", carDoorCount: 3, fuel: .init(fuelCapacity: 100, fuelCunsumtion: 14)),
    Car(carBrand: .BMW, carColor: "White", carDoorCount: 3, fuel: .init(fuelCapacity: 50, fuelCunsumtion: 2)),
    Car(carBrand: .Mazda, carColor: "Black", carDoorCount: 2, fuel: .init(fuelCapacity: 20, fuelCunsumtion: 6)),
    Car(carBrand: .BMW, carColor: "Red", carDoorCount: 4, fuel: .init(fuelCapacity: 25, fuelCunsumtion: 17)),
    Car(carBrand: .Toyota, carColor: "Green", carDoorCount: 2, fuel: .init(fuelCapacity: 40, fuelCunsumtion: 20)),
    Car(carBrand: .Toyota, carColor: "White", carDoorCount: 4, fuel: .init(fuelCapacity: 45, fuelCunsumtion: 16))
]
CarList.forEach { element in
    print(element.carBrand, element.carColor, element.carDoorCount, element.fuel.fuelCapacity, element.fuel.fuelCunsumtion)
}

//4. იპოვეთ ის მანქანა, რომელიც ერთი მთლიანად სავზე ავზით ყველაზე მეტი მანძილის გავლას შეძლებს
let logestRide = CarList.sorted { left, right in
    (left.fuel.fuelCapacity / left.fuel.fuelCunsumtion) > (right.fuel.fuelCapacity / right.fuel.fuelCunsumtion)
}

if let element = logestRide.first{
    print("")
    print(element.carBrand, element.carColor, element.carDoorCount, element.fuel.fuelCapacity, element.fuel.fuelCunsumtion)
    print("")
}


