import UIKit
import PlaygroundSupport
defer { PlaygroundPage.current.finishExecution() }


var year: Int = 2022
var month: Int? = nil
var day:Int = 2
var hour: Int? = nil
var min: Int = 50
var name: String = "misha"
var surName: String = "muchaidze"

var optional = (year, month, day, hour, min, name, surName)

print(optional.1 ?? 8)

let optionalInts = [year, month, day, hour, min, name, surName]

