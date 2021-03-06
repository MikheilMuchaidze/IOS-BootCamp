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
 ๐ข Map arrays
 */
//แแแชแแแฃแแ แแแแแแแแ แจแแแกแ แฃแแแ map แคแฃแแฅแชแแแก แแแแแงแแแแแแ
let mixedStrings = ["text1","text2","text3","text4","text5"]

var uppercasedUsingMap = mixedStrings.map { element in
    element.uppercased()
}
print("uppercasedUsingMap",uppercasedUsingMap)

var uppercasedUsingMapShort = mixedStrings.map { $0.uppercased() }




//แแแชแแแฃแแ แแแกแแแแกแแแ แแแแฆแแ แแแกแแแ แ แแแแแจแแช แแฅแแแแ 3 แแแแแแแขแ แแ แแก แแแแแแแขแ แแฅแแแแ แกแแฎแแแแแ แแ แแแแ แแแ แแแแ แแแแแแแฃแแ.
var persons = [["name1","surname1"],["name2","surname2"],["name3","surname3"]]

let mappedPersons = persons.map { array -> String in
    return array.first! + " "  + array.last!
}
 
print(mappedPersons)


//แแแชแแแฃแแ แแแกแแแแแแ แแแแแ แฃแแแ แแกแแ แแ แ แแแกแแแ แ แแแแแจแแช แแฎแแแแ แแก แชแฎแแแแแแแ แแฅแแแแแแ แ แแแแแแ แขแแแจแแช แจแแแแก แแกแ "a"
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


/*: [flat ๐](@next)
 */

// แแแชแแแฃแแ แแแกแแแแแแ แจแแฅแแแแแ แแแขแแฏแแ แแแแก แแแกแแแ
let arrayOfNumers = ["1","2","10_000","five","-1x"]
var testString = 10_000
testString += 10


let integerValues = arrayOfNumers.compactMap { Int($0) }
integerValues

/*: [compact ๐](@next)
 */

//แจแแฅแแแแแ แแฎแแแแ แกแแฎแแแแแแก แแแกแแแ
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
 ๐ข Map dictionary
 */

/*
 แจแแฅแแแแแ แแฎแแแ dictionary แกแแแแช แแแแจแแแแแแแแแ แจแแแกแแแฃแแ แแฅแแแแ แกแแแขแแแแขแ แแแจแ.
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
 ๐ข Map sets
 */
/*:
 > Set แแ map แคแฃแแฅแชแแแก แแแแแงแแแแแ แแแ แฃแแแแก แแแกแแแก.
 */

let lowercasedSet = Set(["a","b","c","d"])

let upper = lowercasedSet.map { element in
    element.uppercased()
}

print(Set(upper))
