import UIKit
import PlaygroundSupport
defer { PlaygroundPage.current.finishExecution() }

let randomNum = Int.random(in: 1...1000000)

print("tqveni ricxvia = \(randomNum)")

//sxvanairad jer ver movipiqre rogor gadavitano in-idan stringshi monacemebi... mara albat ciklit ramdnairad gamoviyvan
var intToString = [Int]()
intToString.insert(randomNum % 10, at: 0)
intToString.insert(((randomNum - (randomNum % 10)) / 10) % 10, at: 1)
intToString.insert(((randomNum - (randomNum % 100)) / 100) % 10, at: 2)
intToString.insert(((randomNum - (randomNum % 1000)) / 1000) % 10, at: 3)
intToString.insert(((randomNum - (randomNum % 10000)) / 10000) % 10, at: 4)
intToString.insert(((randomNum - (randomNum % 100000)) / 100000) % 10, at: 5)
if randomNum / 1000000 > 1 {
    intToString.insert(((randomNum - (randomNum % 1000000)) / 1000000) % 10, at: 6)
}else{
    print("milionze naklebia")
}

intToString.reverse()
while intToString[0] == 0 {
    intToString.remove(at: 0)
}
print("int gadaviyvane arraishi \(intToString)")
print("ricxvebis raodenoba = \(intToString.count)")
