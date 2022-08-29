import UIKit
import Foundation

// შევქმანთ ექსთენშენი დაბლისთვის

let twoFormat = ".2"
extension Double {
    func format(f: String) -> String {
        return String(format: "%\(f)f", self)
    }
}

// შევქმნათ სტრუქტურის მოდელი

struct FuelExpenses {
    var fuelTankMass: Int
    var carMPG: Double
    
    mutating func countMPG( amountOfUsedFuel: Double){
        self.carMPG = Double((100 / (amountOfUsedFuel)).format(f: twoFormat))!
    }
}


var fuel1 = FuelExpenses(fuelTankMass: Int.random(in: 40...60), carMPG: 9)

// ენამი ბრენდების

enum BrandNames: CaseIterable {
    case toyota, mercedes, bmw, mazda, audi
}

// ბრენდების მიხედვით განვსაზღვროთ რომელ მანქანას რა მოცულობის ავზი შეიძლება ქონდეს

func switchFuelTank (by brandNames: BrandNames ) -> (Int, Int) {
    switch brandNames {
    case .toyota:
        return ( 45, 60)
    case .mercedes:
        return (30, 60)
    case .bmw:
        return (40, 70)
    case .mazda:
       return (50, 60)
    case .audi:
        return (35, 50)
    }
}

// შევქმნათ მანქანის მოდელი

class Car {
    let brandName: BrandNames
    let color: String
    let numberOfDoors: Int
    let fuelExpenses: FuelExpenses
    
    init(brandName: BrandNames, color: String, numberOfDoors: Int, fuelExpenses: FuelExpenses) {
        self.brandName = brandName
        self.color = color
        self.numberOfDoors = numberOfDoors
        self.fuelExpenses = fuelExpenses
    }
    
    convenience init(brandName: BrandNames, color: String, fuelExpenses: FuelExpenses){
        self.init(brandName: brandName, color: color, numberOfDoors: 4, fuelExpenses: fuelExpenses)}
}

// შევქმნათ ფერების არჩევანი

let colorTypes = ["Blue", "White", "Black", "Red", "Orange", "Gray", "Orange"]

// ვაცხადებ ბულიენს რომ  მასივისი შედგენისას ხან ქონვენიენს ინიტი გამოიყენოს და ხან დესიგნეითიდ ინიტი
// და ვქმნით მანქანების მასივს
var bulien = true
var carArray = [Car]()
for _ in 1...15 {
    
    let brandsrandom = BrandNames.allCases.randomElement()!
    fuel1.fuelTankMass = Int.random(in: switchFuelTank(by: brandsrandom).0...switchFuelTank(by: brandsrandom).1)
    let roundDouble = Double.random(in: 10...30)
    fuel1.countMPG(amountOfUsedFuel: roundDouble)
    
    if bulien{
    carArray.append( Car(
        brandName: brandsrandom ,
        color: colorTypes.randomElement()!,
        fuelExpenses: fuel1))
        bulien = false
    } else {
        carArray.append( Car(brandName: brandsrandom, color: colorTypes.randomElement()!, numberOfDoors: Int.random(in: 1...4), fuelExpenses: fuel1))
        bulien = true
    }
    
}

/// ასევე შევქმანთ ფუნქციები რომლებიც ინფუთის გამოტანას გაგვიმარტივებენ
///
///

func printEverything(about car: Car) -> String{

    return " ბრენდი - \( car.brandName) , ფერი - \(car.color) , წვა 100 კმ.ზე -  \(car.fuelExpenses.carMPG) , საწვავის ბაკის მოცულობა - \(car.fuelExpenses.fuelTankMass), კარის რაოდენობა - \(car.numberOfDoors) "
}

func printAboutElemnt( from array : [Car]){
 
    for elem in array{
        print( " ბრენდი - \( elem.brandName) , ფერი - \(elem.color) , წვა 100 კმ.ზე -  \(elem.fuelExpenses.carMPG) , საწვავის ბაკის მოცულობა - \(elem.fuelExpenses.fuelTankMass), კარის რაოდენობა - \(elem.numberOfDoors)"
    )
}
}

print(" ყველა მანქანა  \(printAboutElemnt(from: carArray))" )
print("--------------")



 
 
// დავალება 1. იპოვეთ მანქანა, რომელიც ყველაზე ცოტას წვავს

let sortedCarsByFuelEx = carArray.sorted(by: { $0.fuelExpenses.carMPG < $1.fuelExpenses.carMPG })

let elementof = sortedCarsByFuelEx[0]
print("ყველაზე ცოტას წვავს ", printEverything(about: elementof))
print("--------------")


//// დავალება 2. დააჯგუფეთ მანქანები ბრენდების მიხედვით

let sortedByBrandsName = Dictionary(grouping: carArray, by:  {$0.brandName})

for (_, value) in sortedByBrandsName {
    print( printAboutElemnt(from:value))
}
print("--------------3")


//3. დაალაგეთ მანქანები კარების რაოდენობის მიხედვით

let sortedByDorrs = carArray.sorted(by: {$0.numberOfDoors > $1.numberOfDoors})
print(printAboutElemnt(from: sortedByDorrs))

let dictionaryOfDoors = Dictionary(grouping: carArray, by: {$0.numberOfDoors})
print(dictionaryOfDoors)
    let doorsDictionary = dictionaryOfDoors.mapValues({$0.count})
    let mostCommonDoorNumber = doorsDictionary.sorted(by: {$0.value > $1.value}).first?.key
print("მანქანების უმეტესობას აქვს \(mostCommonDoorNumber!) კარი ")



// 4. იპოვეთ ის მანქანა, რომელიც ერთი მთლიანად სავზე ავზით ყველაზე მეტი მანძილის გავლას შეძლებს

let sortedByFuelTank = carArray.sorted(by: {
    ($0.fuelExpenses.fuelTankMass / Int($0.fuelExpenses.carMPG) ) >  ($1.fuelExpenses.fuelTankMass / Int($1.fuelExpenses.carMPG) )
})
print(" --- ")
print("სავსე ბაკით ყველაზე დიდ მანძილს ფარავს - \(printEverything(about: sortedByFuelTank[0] )) ")



// 5. ყველაზე მეტი რომელი ფერის მანქანა არის მასივში

let dictionaryOfColors = Dictionary(grouping: carArray, by: {$0.color})
    let myDictionary = dictionaryOfColors.mapValues({$0.count})
    let mostCommonColor = myDictionary.sorted(by: {$0.value > $1.value}).first?.key
print("ყველაზე პოპულარული ფერია \(mostCommonColor!)")

//
 //6. იპოვეთ ის ბრენდი, რომელსაც საშუალო საწვავის ხარჯი ყველაზე ცოტა აქვს
 
 
 // ვიპოვოთ საშუალო წვა ბრენდების მიხედვით
 // უკვე გვაქვს sortedByBrandsName ცვლადი
 
var newDictionary =  [BrandNames : Int]()

for (key, value ) in sortedByBrandsName {
    let avarageFuel = (value.reduce(0){$0 + Int($1.fuelExpenses.carMPG)}) / value.count
    newDictionary.updateValue(Int(avarageFuel), forKey: key)
   print( " \(key) -ს საშუალო წვა არის - \(avarageFuel)")
}
 
let mostafordableCar = newDictionary.sorted(by: {$0.value < $1.value}).first!.key
print("საშუალოდ ყველაზე ნაკლები საწვავის ხარჯი \(mostafordableCar) აქვს")
 
