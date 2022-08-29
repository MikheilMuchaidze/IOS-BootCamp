// Copy from the 1st Task
// ------------------------------------------------------------------------------------------------------------------------------------------------
let alphabet = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]

// 1. დააგენერირეთ 5 წევრიანი მასივი 1-დან 30-ის ჩათვლით
let arraySize = 5
let lower = 1
let upper = 30
var arrayOfInts = (0..<arraySize).map { _ in
    Int.random(in: lower...upper)
}

// 2. შექმენით სტრინგების ორ განზომილებიანი მასივი, HoF-ით
let gridOfStrings = arrayOfInts.map { number -> [String] in
    let charIndex = number - 1 < alphabet.count ? number - 1 : Int.random(in: 0..<alphabet.count)
    let retValue = (0..<number).map { _ in
        alphabet[charIndex]
    }
    return retValue
}
// ------------------------------------------------------------------------------------------------------------------------------------------------
// 1. flatMap to combine all subarrays together
// 2. Set to get only unique elements from 1D array
// 3. .sorted() for sorting the unique-element-array lexicographically
// 4. .reduce() for combining Strings from [String] returned by sorted()
let sortedString = Set(gridOfStrings.flatMap { $0 }).sorted().reduce("",+)
print(sortedString)
