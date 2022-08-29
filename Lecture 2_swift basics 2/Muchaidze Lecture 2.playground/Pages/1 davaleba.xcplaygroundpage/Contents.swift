import UIKit
import PlaygroundSupport
defer { PlaygroundPage.current.finishExecution() }

let grade = Int.random(in: 1...100)
print("tqveni nishania = \(grade)")

switch grade {
    case 90...100:
        print(">90 => A")
    case 80...89:
        print(">80 => B")
    case 70...79:
        print(">70 => C")
    case 60...69:
        print(">60 => D")
    case 40...59:
        print(">40 => E")
    default:
        print("40 => F")
}

