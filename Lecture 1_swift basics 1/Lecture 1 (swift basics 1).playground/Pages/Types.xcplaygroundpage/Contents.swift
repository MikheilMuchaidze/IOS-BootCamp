import UIKit
import PlaygroundSupport
defer { PlaygroundPage.current.finishExecution() }
/*:
 [👈 introduction](@previous)                [introduction](introduction)                [Optionals 👉](@next)
 # მონაცემთა ტიპები
 ## ცალკეულ მონაცემთა ტიპები
 ## მონაცემთა კოლექციის ტიპები
 */



/*:
 * Important:
    * Constants & Variables
    * String
    * Character
    * Integers
    * Floating-Point Numbers
    * Booleans
    * Tuples
 ---
 */

import Foundation

var k : Character = "k"



/*:
 >კონსტანტების და ცვლადების სახელებად შეგიძლიათ გამოიყენოთ ნებისმიერი სიმბოლო გარდა უნიკოდის სიმბოლოებისა \
 >მაგ: ∑ @
 */

/*:
 ცვლადების და მუდვივების გამოცხადება/აღწერა
 */
let greetingUsingConstant = "Hello playground"
var greetingUsingVariable = "Hello, playground"

greetingUsingVariable = "Hello"
print(5)
print(5)

//რამდენიმე ერთი ტიპის ცვლადის ერთდროულად გამოცხადება

var name1, name2, name3 : Int


/*:
 ცვლადების და მუდვივების დაბეჭდვა
 */



/*:
 კომენტარები
 */



/*:
 მთელი რიცხვები და მათი ზღვრები
 */

print(UInt8.max)
print(UInt16.max)
print(UInt32.max)
print(UInt64.max)

print(Int8.max)
print(Int16.max)
print(Int32.max)
print(7*8)
print(7*7.8)

/*:
 წილადი რიცხვები float vs double
 */
var number3: Float = 3.5
let number1 : Float = 32.448111112345678912345
let number2 = 324489.1
print(number2)
/*:
 Bool ტიპის მონაცემი
 */


/*:
 Tuples
 */

var person1 = (firstName: "Gandalf", age: 99, hairColor: "whte")
var frodo = ("Frodo",18)
var ss = ["sd": 12, "1": 12]
frodo = ("abc",123)


/*:
 [👈 introduction](@previous)                                                    [Optionals 👉](@next)
 */
