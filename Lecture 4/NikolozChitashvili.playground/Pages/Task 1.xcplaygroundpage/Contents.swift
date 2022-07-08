// 1. მოცემულია მასივი let alphabet = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]. დააგენერირეთ 5 წევრიანი მასივი 1-დან 30-ის ჩათვლით. შექმენით სტრინგების ორ განზომილებიანი მასივი სადაც თითოეული ქვემასივი შეიცავს იმ რაოდენობის ინგლისური ანბანის ასოს რა მნიშვნელობაც ექნება დაგენერირებული მასივის ელემენტებს. ასევე დაგენერირებული მასივის წევრის მნიშვნელობა უნდა შეესაბამებოდეს ქვემასივში დამატებული ელემენტის პოზიციას ანბანში. მაგ. 2 - ის შემთხვევაში ქვემასივი უნდა შეიცავდეს 2 ცალ "B"-ს. იმ შემთხვევაში თუ დაგენერირებული რიცხვი ცდება ანბანის რაოდენობას დაამატეთ შემთხვევითი სიმბოლო ანბანიდან იგივე პრინციპით.

let alphabet = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
let a = alphabet.count
print(a)
// 1. დააგენერირეთ 5 წევრიანი მასივი 1-დან 30-ის ჩათვლით
let arraySize = 5
let lower = 1
let upper = 30
var arrayOfInts = (0..<arraySize).map { _ in
    Int.random(in: lower...upper)
}
print(arrayOfInts)
// 2. შექმენით სტრინგების ორ განზომილებიანი მასივი, HoF-ით
var gridOfStrings = arrayOfInts.map { (number) -> [String] in
    var retValue = [String]()
    let charIndex = number - 1 < alphabet.count ? number - 1 : Int.random(in: 0..<alphabet.count)
    for _ in 0..<number {
        retValue +=  [alphabet[charIndex]]
    }
    return retValue
}

print(gridOfStrings)
