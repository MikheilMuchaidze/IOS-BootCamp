import Cocoa

var randomOptionalNums = [Int?]()
var randomNum: Int

for _ in 0...9 {
    randomNum = Int.random(in: 1...120)
    randomOptionalNums.append(randomNum.isMultiple(of: 5) ? randomNum : nil)
}

print(randomOptionalNums)

var array1 = [Int]()
var array2 = [Int]()
var array3 = [Int]()
var array4 = [Int]()

// using nil coalesing
for numberCheck in randomOptionalNums {
    array1.append(numberCheck ?? Int.random(in: 1...50))
}
print(array1)

// using if let unwrap
for i in 0...randomOptionalNums.count - 1 {
    if let number = randomOptionalNums[i] {
        array2.append(number)
    } else {
        array2.append(Int.random(in: 1...50))
    }
}
print(array2)

// guard let unwrap
for i in 0...randomOptionalNums.count - 1 {
    unwrap(numberToCheck: randomOptionalNums[i])
}

func unwrap(numberToCheck: Int?) {
    guard let number = numberToCheck else {
        array3.append(Int.random(in: 1...50))
        return
    }
    array3.append(number)
}
print(array3)

// using if to unwrap
for i in 0...randomOptionalNums.count - 1 {
    if randomOptionalNums[i] != nil {
        array4.append(randomOptionalNums[i]!)
    } else {
        array4.append(Int.random(in: 1...50))
    }
}
print(array4)
