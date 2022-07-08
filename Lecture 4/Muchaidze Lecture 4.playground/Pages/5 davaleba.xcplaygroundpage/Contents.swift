import UIKit
import PlaygroundSupport
import Darwin

//sawyisi monacemebi
let people = [
    (name: "ვაჟა", age: 22),
    (name: "მურთაზი", age: 12),
    (name: "შუქური", age: 12),
    (name: "დინარა", age:19),
    (name: "ფრიდა", age:88)
]
print("saxelebi da asakebi - \(people)")

//mushaoba punqiebit
let filterByAge = people.filter { schoolAge in
    schoolAge.age >= 6 && schoolAge.age <= 18
    
}
//adamianebis sia 6 -:- 18 wlovan diapazonshi
print("isini visi asakis moxvda 6 -:- 18 diapazonshi\(filterByAge)")
//asakebis jami
let sumOfAge = filterByAge.reduce(0){ mimdJami, dasamatebeli in
    mimdJami + dasamatebeli.age
}
let avarageAge = sumOfAge / filterByAge.count
print("sashualo asakia - \(avarageAge)")
