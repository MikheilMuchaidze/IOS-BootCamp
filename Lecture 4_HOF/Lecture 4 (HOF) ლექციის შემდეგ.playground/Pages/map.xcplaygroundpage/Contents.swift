import UIKit

/*:
 Higher Order Functions
 */

/*:
 * Important:
   * map
   * compactMap
   * flatMap
   * reduce
   * filter
   * removeAll
   * contains
   * foreach
   * sorted
 ---
 */

/*:
 🟢 Map arrays
 */
//მოცემული დავალება შეასრულეთ map ფუნქციის გამოყენებით
let mixedStrings = ["text1","text2","text3","text4","text5"]

var uppercasedUsingMap = mixedStrings.map { element in
    element.uppercased()
}
print("uppercasedUsingMap",uppercasedUsingMap)

var uppercasedUsingMapShort = mixedStrings.map { $0.uppercased() }




//მოცემული მასივისგან მიიღეთ მასივი რომელშიც იქნება 3 ელემენტი და ეს ელემენტი იქნება სახელები და გვარები გაერთიანებული.
var persons = [["name1","surname1"],["name2","surname2"],["name3","surname3"]]

let mappedPersons = persons.map { array -> String in
    return array.first! + " "  + array.last!
}
 
print(mappedPersons)


//მოცემული მასივიდან დააბრუნეთ ისევ ორი მასივი რომელშიც მხოლოდ ის ცხოველები იქნებიან რომელთა ტიპშიც შედის ასო "a"
let animals = [
    ["dog","cat","cow"],
    ["tiger","lion","gepard","cangaroo"]
]

let filteredAnimals = animals.map { animals -> [String] in
    var animalsContainingA = [String]()
    for animal in animals {
        if animal.contains("a") {
            animalsContainingA.append(animal)
        }
    }
    return animalsContainingA
}

print(filteredAnimals)


/*: [flat 👉](@next)
 */

// მოცემული მასივიდან შექმენით ინტეჯერების მასივი
let arrayOfNumers = ["1","2","10_000","five","-1x"]
var testString = 10_000
testString += 10


let integerValues = arrayOfNumers.compactMap { Int($0) }
integerValues

/*: [compact 👉](@next)
 */

//შექმენით მხოლოდ სახელების მასივი
let basketballPlayers = [
    (name: "Bryant",number: 24),
    (name: "Jordan",number: 23),
    (name: "Durant",number: 35),
    (name: "lebron",number: 23)
]

let namesOfPlayers = basketballPlayers.map { player in
    player.name
}

print(namesOfPlayers)


/*:
 🟢 Map dictionary
 */

/*
 შექმენით ახალი dictionary სადაც მნიშვნელობები შევსებული იქნება სანტიმეტრებში.
 FYI - 1 inch = 2.54 cm
 */
let monitorsByInches = [
    "sony" : 25.0,
    "samsuns" : 30.0,
    "siemens" : 28.0,
    "viewsonic" : 25.0
]

let monitorsByCm = monitorsByInches.map { pair in
    pair.key
}

print(monitorsByCm)

/*:
 🟢 Map sets
 */
/*:
 > Set ზე map ფუნქციის გამოყენება აბრუნებს მასივს.
 */

let lowercasedSet = Set(["a","b","c","d"])

let upper = lowercasedSet.map { element in
    element.uppercased()
}

print(Set(upper))
