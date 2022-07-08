import Foundation

// დაწერეთ ფუნქცია რომელიც პარამეტრად მიიღებს ორი მთელი რიცხვების მასივს და დააბრუნებს მათ თანაკვეთას

func showIntersection(firstArr x: [Int], secondArr y: [Int]) -> [Int] {
    Array(Set(x).intersection(Set(y)))
}

let testArr1 = [12,14,15,26,78,58]
let testArr2 = [12,33,15,78,78,90]

print(showIntersection(firstArr: testArr1, secondArr: testArr2))
