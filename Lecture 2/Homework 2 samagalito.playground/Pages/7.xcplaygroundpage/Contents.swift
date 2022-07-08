import Cocoa

var randomNum1 = Int.random(in: 1...100)
var randomNum2 = Int.random(in: 1...100)
var randomNum1AllDivisorSum = 1
var randomNum2AllDivisorSum = 1
var i = 2

while i*i <= randomNum1 {
    if randomNum1 % i == 0 {
        randomNum1AllDivisorSum += (i * i == randomNum1) ? i : i + (randomNum1 / i)
    }
    i += 1
}

i = 2
while i*i <= randomNum2 {
    if randomNum2 % i == 0 {
        randomNum2AllDivisorSum += (i * i == randomNum2) ? i : i + (randomNum2 / i)
    }
    i += 1
}

print("First random number is \(randomNum1)")
print("Sum of all divisors of random number1 is \(randomNum1AllDivisorSum)")
print("Second random number is \(randomNum2)")
print("Sum of all divisors of random number2 is \(randomNum2AllDivisorSum)\n")

print("\( (randomNum1AllDivisorSum > randomNum2AllDivisorSum) ? randomNum1 : randomNum2) divisors sum is greater")



