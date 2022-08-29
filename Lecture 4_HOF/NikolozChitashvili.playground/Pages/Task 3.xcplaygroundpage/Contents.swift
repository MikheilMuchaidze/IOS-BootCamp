//3. დააგენერირეთ წილადი რიცხვების 30 წევრიანი მასივი 20 დან 50 ის ჩათვლით. დაამრგვალეთ მასივის თითოეული წევრი და დატოვეთ მხოლოდ ლუწი რიცხვები.

let arraySize = 30
let lower = 20.0
let upper = 50.0

var generatedNumbers = (0..<arraySize).map { _ in
    Double.random(in: lower...upper)
}

let roundedNumbers = generatedNumbers.map { Int($0) }.filter { $0.isMultiple(of: 2) }

print(roundedNumbers)
