import UIKit

//  დაწერეთ ფუნქცია რომელიც პარამეტრად მიიღებს მთელი რიცხვების მასივს და დააბრუნებს რამდენი განსხვავებული ელემენტია მასში (სორტირების გამოყენების გარეშე)

func countUniqueElementsInArray (givenArray: [Int]) -> Int {
     Set(givenArray).count
}

let testArray = [12,12,34,13,15,26,37,48,48]

print("მასივში არის \(countUniqueElementsInArray(givenArray: testArray)) ელემენტი")
print("მასივში არის \(countUniqueElementsInArray(givenArray: [2,2,2,3,3,11,15])) ელემენტი")


