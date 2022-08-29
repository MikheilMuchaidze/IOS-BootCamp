import UIKit
import PlaygroundSupport
defer { PlaygroundPage.current.finishExecution() }

let Min = 100
let Max = 400

//varianti for...in ciklit
for Luwi in Min...Max {
    if Luwi % 2 == 0 {
        print(Luwi)
    }
}


//varianti while ciklit
var Start = Min

while Start <= Max {
    if Start % 2 == 0 {
        print(Start)
    }
    Start = Start + 1
}


//varianti repeat while ciklit
var Start1 = Min
repeat {
    if Start1 % 2 == 0 {
        print(Start1)
    }
    Start1 = Start1 + 1
} while Start1 != (Max + 2)



