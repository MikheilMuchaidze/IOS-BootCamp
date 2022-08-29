import UIKit
import PlaygroundSupport
import Darwin
defer { PlaygroundPage.current.finishExecution() }
/*
var randomInt1 = Int.random(in: 30...60)
print(randomInt1)

var randomInt2 = Int.random(in: 30...60)
print(randomInt2)
*/
for _ in 1...3 {
    let randomInt1 = Int.random(in: 30...60)
    print(randomInt1, "pirveli random ricxvi")

    let randomInt2 = Int.random(in: 30...60)
    print(randomInt2, "pirveli random ricxvi")

    let jami = randomInt1 + randomInt2
    if (jami % 2 == 0) || (jami > 100) {
        print(jami)
    }
    else{
        print("ricxvebis jami arc luwia da arc 100-ze metia...")
    }
}
