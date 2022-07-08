import Foundation
/*
 1. მოცემულია მასივი let alphabet = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]. დააგენერირეთ 5 წევრიანი მასივი 1-დან 30-ის ჩათვლით. შექმენით სტრინგების ორ განზომილებიანი მასივი სადაც თითოეული ქვემასივი შეიცავს იმ რაოდენობის ინგლისური ანბანის ასოს რა მნიშვნელობაც ექნება დაგენერირებული მასივის ელემენტებს. ასევე დაგენერირებული მასივის წევრის მნიშვნელობა უნდა შეესაბამებოდეს ქვემასივში დამატებული ელემენტის პოზიციას ანბანში. მაგ. 2 - ის შემთხვევაში ქვემასივი უნდა შეიცავდეს 2 ცალ "B"-ს. იმ შემთხვევაში თუ დაგენერირებული რიცხვი ცდება ანბანის რაოდენობას დაამატეთ შემთხვევითი სიმბოლო ანბანიდან იგივე პრინციპით.
 */

let alphabet = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]

var arrayOfIndex = (0..<5).map { _ in Int.random(in: 1...30) }
print(arrayOfIndex)
var repeatingAlphabetLetters = [[String]]()

arrayOfIndex.indices.forEach { index in
    //  შევქმნათ "უსაფრთხო" ინდექსი
    let safeIndex = arrayOfIndex[index] > 26 ? Int.random(in: 1..<26) : arrayOfIndex[index]
    
    //  ჩავანაცვლოთ ისეთი arrayOfIndex მასივში ის მნიშვნელობა რომელიც > 26 safeIndex ით
    arrayOfIndex[index] = safeIndex
    
    //  repeatElement ფუნქციის გამოყენებით შევქმნათ სტრინგების მასივი რომელშიც იქნება safeIndex რაოდენობის ერთიდა იგივე სიმბოლო
    let arrayOfRepetitiveElements = Array(repeatElement(alphabet[safeIndex - 1], count: safeIndex))
    repeatingAlphabetLetters.append(arrayOfRepetitiveElements)
}
print("Array OF Indexs: \(arrayOfIndex)")
print("Repeating Alphabet Letters Array: \(repeatingAlphabetLetters)")



/*
 2. პირველ ამოცანაში მიღებული ორგანზომილებიანი მასივისგან შექმენით ანბანის მიხედვით სორტირებული სტრინგი სადაც ყველა სიმბოლო იქნება უნიკალური.
 */

let sortedArray = Set(repeatingAlphabetLetters.flatMap { $0 }).sorted()
let sortedUniqueStr  = sortedArray.reduce("", +)

print("Sorted Array Of Unique Letters: \(sortedUniqueStr)")

