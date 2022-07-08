import Foundation

//     დაწერეთ ფუნქცია, რომელიც მიიღებს სამ პარამეტრს: ორი მთელი რიცხვების მასივს და  ქლოჟერს, ქლოჟერის მეშვეობით დაბეჭდეთ ამ მასივების გაერთიანება.

let intersectionFinderClosure1: ([Int] , [Int]) -> [Int] = { x, y   in
    return Array(Set(x).intersection(Set(y)))
}

func closureFindsIntersection (firstArr: [Int], secondArr: [Int], closure: ([Int], [Int])-> [Int]) {
    print(closure(firstArr, secondArr))
}

let testArray1 = [1,12,13,14,15,22,13]
let testArray2 = [1,33,13,54,15,23,13]

closureFindsIntersection(firstArr: testArray1, secondArr: testArray2, closure: intersectionFinderClosure1)

