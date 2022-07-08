import UIKit
import PlaygroundSupport
defer { PlaygroundPage.current.finishExecution() }

var list =  [Int]()

for _ in 0...10 {
    list.append(Int.random(in: 1...10))
}

print("sawyisi masivi = \(list)")

var count = [Int: Int]()

//es konkretuli kodis nawili cota ver gaviazre imitom rom internetshi dzebnis shedegad gamoviyvane
for num in list{
    count[num] = (count[num] ?? 0) + 1
}

print(count)

//aseve aq ver davbechde is konkretuli key romelic yvelaze mitjer meordeba
for (key, value) in count{
    print("\(key) aris \(value) cali")
}

