import Cocoa

//var randomNum = Int.random(in: 1...1_000_000)
var randomNum = 1234
print(randomNum)

// method 1
var randomNumInString: String = "\(randomNum)"
print("\(randomNumInString.count) digits count using method 1")

// method 2
var digitsCount = 0
while (randomNum > 0) {
    digitsCount += 1
    randomNum /= 10
    print(randomNum)
}
print("\(digitsCount) digits count using method 2")

