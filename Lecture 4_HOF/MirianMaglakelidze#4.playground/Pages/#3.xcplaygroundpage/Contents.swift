import Foundation

/*
 3. დააგენერირეთ წილადი რიცხვების 30 წევრიანი მასივი 20 დან 50 ის ჩათვლით. დაამრგვალეთ მასივის თითოეული წევრი და დატოვეთ მხოლოდ ლუწი რიცხვები.
 */


let doublesArray = (0..<30).map { _ in Float.random(in: 20...50) }
let roundedEvenArray = doublesArray.map { Int($0.rounded()) }.filter { $0.isMultiple(of: 2) }

print("Double Array : \(doublesArray)")
print("Rounded Even Array : \(roundedEvenArray)")
