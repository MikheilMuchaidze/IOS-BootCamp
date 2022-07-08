/*:
 [👈 types](@previous)                [introduction](introduction)                [statements 👉](@next)
 ## Optionals
 */


let score = "88"
let scoreAsInt = Int(score)

//print(scoreAsInt!)


/*:
 - Callout(?  !): რა განსხვავებაა "?" და "!" შორის
 */


var regularInt: Int
var optional: Int?
var implicitlUnwrappedOptional: Int!

optional = 67
optional = nil
regularInt = optional ?? 9

print(regularInt)

/*:
 [👈 types](@previous)                               [statements  👉](@next)
 */
