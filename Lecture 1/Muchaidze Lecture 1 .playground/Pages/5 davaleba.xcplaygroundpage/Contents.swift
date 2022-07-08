import UIKit
import PlaygroundSupport
defer { PlaygroundPage.current.finishExecution() }

let age = Int.random(in: 0...30)
//pirveli varianti
let checkAge = age > 18 ? "is an adult" : "is a kid"

print(age, checkAge)
//meore varianti
age > 18 ? print("\(age) is an adult") : print("\(age) is a kid")

