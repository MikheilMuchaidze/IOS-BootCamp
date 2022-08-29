import UIKit
import Security

//რა არის Generic?

//დაწერეთ ფუნქცია, რომელიც პარამეტრად მიიიღებს ნებისმიერ ტიპს და დაბეჭდავს მას.

func printArgument1<T>(arg: T,arg2: T) {
    print(arg,"-----",arg2)
}


func printArgument<T,U>(arg: T,arg2: U) {
    print(arg,"-----",arg2)
}

printArgument(arg: "A",arg2: 7)
printArgument(arg: 5.2,arg2: "R")
printArgument(arg: "-3",arg2: "Q")

//შექმენით ფუნქცია რომელიც იღებს ორ პარამეტრს და ბეჭდავს ამ ორის ჯამს შეამოწმეთ Int და Double

//func sumOfInts(num1: Int, num2: Int) {
//    print(num1+num2)
//}
//sumOfInts(num1: 5, num2: 4)
//sumOfInts(num1: 5.4, num2: 4.4)

//იგივე ამოცანა Generic
//func sumOfInts<T: RangeReplaceableCollection>(num1: T, num2: T) {
//    print(num1+num2)
//}
//sumOfInts(num1: 12, num2: 12)




// შექმენით 2 კლასი მანქანა და ველოსიპედი.

class Car {
    
    let manufacturer: String!
    let buildYear: Int!
    var price: Double!
    let topSpeed: Double!
    
    init(manufacturer: String!,buildYear: Int!,price: Double!,topSpeed: Double!) {
        self.manufacturer = manufacturer
        self.buildYear = buildYear
        self.price = price
        self.topSpeed = topSpeed
    }
    
    public static var dummyCars: [Car] {
        return [
            Car(manufacturer: "Mercedes",
                buildYear: 2020,
                price: 50_000,
                topSpeed: 320
               ),
            Car(manufacturer: "BMW",
                buildYear: 2022,
                price: 45_000,
                topSpeed: 350
               )
        ]
    }
}


class Bicycle {
   
    let manufacturer: String
    var price: Double!
    let topSpeed: Int!
    let wheelSize: Double
    
    init(manufacturer: String, wheelSize: Double!,price: Double!,topSpeed: Int!) {
        self.manufacturer = manufacturer
        self.price = price
        self.topSpeed = topSpeed
        self.wheelSize = wheelSize
    }
    
    init(){
        self.price = Double.random(in: 100...1000)
        self.topSpeed = Int.random(in: 200...350)
        self.wheelSize = Double.random(in: 18...30)
        self.manufacturer = ["Honda","Suzuki"].randomElement() ?? "Hurley"
    }
    
    public static var dummyBicycles: [Bicycle] {
        return [
            Bicycle(),
            Bicycle()
        ]
    }
}
typealias CarCompletion = ([Car])->Void

//შექმენით და გამოიძახეთ ქლოჟერიანი ფუნქცია რომელიც დააბრუნებს მანქანის სატესტო მასივს
func getDummyCars(completion: @escaping ([Car])->Void) {
    print("cars is loading...")
    DispatchQueue.main.asyncAfter(deadline: .now()+3) {
        completion(Car.dummyCars)
    }
}

//getDummyCars { allCars in
//    for car in allCars {
//        print(car.manufacturer!)
//    }
//}

//შექმენით და გამოიძახეთ ქლოჟერიანი ფუნქცია რომელიც დააბრუნებს ველოსიპედის სატესტო მასივს

func getDummyBicycles(completion: @escaping ([Bicycle])->Void) {
    
    print("Bicycles is loading...")
    DispatchQueue.main.asyncAfter(deadline: .now()+3) {
        completion(Bicycle.dummyBicycles)
    }
}

//getDummyBicycles { bicycles in
//    for bicycle in bicycles {
//        print(bicycle.manufacturer)
//    }
//}

//შექმენით პროტოკოლი movable რომელიც მოიცავს ტრანსპორტის მასივის ცვლადის განსაზღვრებას

protocol Movable {
    associatedtype Item
    static var dummyData: Item { get }
}


//გადაფარეთ ეს პროტოკოლი თითოეულ კლასში.
extension Car: Movable, Comparable {
    
    static func < (lhs: Car, rhs: Car) -> Bool {
        lhs.topSpeed < rhs.topSpeed
    }
    
    static func == (lhs: Car, rhs: Car) -> Bool {
        lhs.manufacturer == rhs.manufacturer
    }
    
    static var dummyData: [Car] {
        Car.dummyCars
    }
}

extension Bicycle: Movable, Comparable {
    
    static func < (lhs: Bicycle, rhs: Bicycle) -> Bool {
        lhs.price < rhs.price
    }
    
    static func == (lhs: Bicycle, rhs: Bicycle) -> Bool {
        lhs.manufacturer == rhs.manufacturer
    }
    
    static var dummyData: [Bicycle] {
        Bicycle.dummyBicycles
    }
}


//შექმენით Generic T ქლოჯერიანი ფუნქცია რომელიც დააბრუნებს ტრანსპორტის ტიპის მასივს

typealias ComparableMovable = Movable & Comparable

func getDummyTransport<T: ComparableMovable >(completion: ([T])->Void) {
    print("🔴", T.self)
    let allData = T.dummyData as! [T]
    completion(allData.sorted())
}

getDummyTransport { (cars: [Car] ) in
    print("\n")
    print("----------------")
    
    for car in cars {
        print(car.manufacturer, "-----", car.topSpeed!)
    }
}

getDummyTransport { (bicycles: [Bicycle]) in
    print("\n")
    print("----------------")

    for bicycle in bicycles {
        print(bicycle.manufacturer, "-----", bicycle.price!)
    }
}

//გამოიძახეთ ეს ფუნქცია მანქანისთვის და ველოსიპედისთვის

//დაასორტირეთ მანქანები სისწრაფის მიხედვით, ველოსიპედები კი ფასის მიხედვით
