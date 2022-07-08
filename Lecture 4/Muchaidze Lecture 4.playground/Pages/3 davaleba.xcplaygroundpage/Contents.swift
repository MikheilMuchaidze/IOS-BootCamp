import UIKit
import PlaygroundSupport
import Darwin

//masivis gamocxadeba
var firstArray = [Double]()
//masivis shevseba elementebit
for _ in 0..<30 {
    firstArray.append(Double.random(in: 20...50))
}
//sawyisi masivis gamotana
print("sawyisi masivi \(firstArray)")
//masivebze mushaoba
let roundedArray = firstArray.map { number in
    round(number)
}.filter { luwi in
    luwi.truncatingRemainder(dividingBy: 2.0) == 0
}
//axali damrgvalebuli da ukento masivis bechdva
print("")
print("damrgvalebuli da ukento masivi\(roundedArray)")
