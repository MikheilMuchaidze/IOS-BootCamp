/*:
 [๐ types](@previous)                [introduction](introduction)                [statements ๐](@next)
 ## Optionals
 */


let score = "88"
let scoreAsInt = Int(score)

//print(scoreAsInt!)


/*:
 - Callout(?  !): แ แ แแแแกแฎแแแแแแแ "?" แแ "!" แจแแ แแก
 */


var regularInt: Int
var optional: Int?
var implicitlUnwrappedOptional: Int!

optional = 67
optional = nil
regularInt = optional ?? 9

print(regularInt)

/*:
 [๐ types](@previous)                               [statements  ๐](@next)
 */
