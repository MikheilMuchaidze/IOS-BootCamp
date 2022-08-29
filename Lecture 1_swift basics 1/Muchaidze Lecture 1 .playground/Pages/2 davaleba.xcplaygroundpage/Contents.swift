import UIKit
import PlaygroundSupport
defer { PlaygroundPage.current.finishExecution() }

let Min = 10
let Max = 100

//varianti for...in ciklit
for Test1 in Min...Max {
    if Test1 % 10 == 0 && Test1 > 50 {
        print(Test1*2)
    }
}

//varianti while ciklit
var Test2 = Min

while Test2 <= Max {
    if Test2 % 10 == 0 && Test2 > 50 {
        print(Test2*2)
    }
    Test2 = Test2 + 1
}


//varianti repeat while ciklit
var Test3 = Min
repeat {
    if Test3 % 10 == 0 && Test3 > 50 {
        print(Test3*2)
    }
    Test3 = Test3 + 1
} while Test3 != (Max + 2)

