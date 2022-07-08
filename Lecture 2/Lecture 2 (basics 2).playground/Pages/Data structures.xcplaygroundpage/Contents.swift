//: [Previous](@previous)
import Foundation
import PlaygroundSupport
defer { PlaygroundPage.current.finishExecution() }
/*:
### მონაცემთა კოლექციის ტიპები
*/
/*:
 * Important:
    * Array
    * set
    * Dictionary
 ---
 */

/*:
 ![კოლექციის ტიპები](collectionTypes.png width="700" height="200")
 */


/*:
 Array
 */
/*:
    * მასივის შექმნა
    * მოქმედებები მასივზე
 ---
 */

/*:
 ![მასივი](arrayImage.jpeg width="400" height="200")
 */

//შექმენით მთელი რიცხვებისგან შემდგარი 2 მასივი
var numbers1 = [1,2,3,4,5]
var numbers2 = [10,20,30,40,50]

//დაამატეთ პირველ მასივში ელემენტი 8
numbers1.append(8)
numbers1 += [8]

//ჩასვით პირველ მასივში რიცხვი 7 მე 2 ადგილზე 🙋‍♀️🙋‍♂️
let index: Int?

//numbers1.insert(7, at: (index ?? 4))

//შეამოწმე მეორე მასივი არის თუ არა ცარიელი


//პირველ მასივს დაამატეთ მეორე მასივის ელემენტები
numbers1 += numbers2

// დაბეჭდე მასივის ელემენტები ინდექსებთან ერთად 🙋‍♀️🙋‍♂️
numbers1.append(contentsOf: numbers2)


/*:
 Set
 */

/*:
    * სიმრავლის შექმნა
    * მოქმედებები სიმრავლეზე
 ---
 */

/*:
 მოქმედებები სიმრავლეებზე
 */

/*:
 ![სიმრავლეები](sets.png width="350" height="300")
 */
// შექმენით ორი სიმრავლე ადამიანების სადაც, პირველში ინქება ისინი ვინც თამაშობენ ფეხბურთს, მეორეში კი ისინი ვინც ვინც სწავლობენ iOS პროგრამირებას(მივიჩნიოთ რომ ერთი და იგივე სახელი ერთი და იგივე ადამიანს აღნიშნავდეს)
let setOfnumbers = Set<Int>()

var soccer: Set<String> = ["Giorgi", "Daviti", "Nikolozi","Mariami","Nino"]
var ios: Set<String> = ["Giorgi","Nino","Ana"]

// იპოვეთ იმ ადამიანთა სიმრავლე ვინც თამაშობს მხოლოდ ფეხბურთს
//let onlySoccerPlayers = soccer.subtract(ios)
//print(soccer)

// იპოვეთ და დაბეჭდეთ იმ ადამიანთა სიმრავლე ვინც თამაშობს ფეხბურთს და სწავლობს iOS პროგრამირებას
soccer.intersection(ios)

// წაშალეთ ყველა ელემენტი პირველი სეტიდან 🙋‍♀️🙋‍♂️
soccer.removeAll()

/*:
 Dictionary
 */
/*:
    * Dictionary-ს შექმნა
    * მოქმედებები Dictionary-ზე ()
 ---
 */
//შექმენით  Dictionary სადაც key იქნება ადამიანის სახელი, ხოლო value იქნება ასაკი
var personDict = ["pres1" : 17,
                  "pers2": 18,
                  "pers3" : 14
]

//დაამატეთ 1 ადამიანი
personDict["newPer"] = 29

print(personDict)

//ერთერთს შეუცვალეთ ასაკი 
personDict["newPer"] = 34
print(personDict)
personDict.updateValue(23, forKey: "newPer")
print(personDict)

//დაბეჭდეთ მხოლოდ ასაკები&სახელები
print(personDict.keys)
print(personDict.values)

for (key,value) in personDict{
    print("key is \(key), value is \(value)")
}

//წაშალეთ ყველა მონაცემი
personDict.removeAll()

//⚠️


//: [Next](@next)
