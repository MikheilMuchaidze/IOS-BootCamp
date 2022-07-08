import UIKit

enum Corner: CaseIterable {
    case left
    case right
    case top
    case bottom
    case topLeft
    case topRight
    case bottomLeft
    case bottomRight
    case middle
}

var corners = (1...10).compactMap { _ in Corner.allCases.randomElement() }

corners.forEach { elem in
    print(elem)
}

//მოცემულია ენამი - Corner
//და მასივი - corners
//1. corners მასივი გარდაქმენი ახალი სტრინგების მასივად.
var newStringArray = [String]()

corners.map { elem in
    newStringArray.append("\(elem)")
}
print(newStringArray)

//2. გაიგე არის თუ არა ყველა ელემენტი top ან middle ან bottom.
newStringArray.forEach { elem in
    if elem == "top" && elem == "middle" && elem == "bottom" {
        print("ყველა ელემენტი top ან middle ან bottom")
    } else {
        print("ყველა ელემენტი top ან middle ან bottom - araaaa")
    }
}

//3. გაიგე შეიცავს თუ არა corners-ი მინიმუმ ორ left-ს.



//4. გაიგე corners-ში არსებული უნიკალური ელემენტების რაოდენობა.
let uniqueString = Set(newStringArray)
print(uniqueString.count)

//5. გაიგე მასივის პირველ ნახევარში უფრო მეტი right არის თუ მეორე ნახევარში.
if newStringArray.contains("right") {
    print("yes")
} else {
    print("no")
}

//6. წაშალე ყველა ელემენტი, რომელიც არ არის bottomRight.
var arrayWithoutbottomRight = [String]()

newStringArray.map { elem in
    if elem != "bottomRight" {
        arrayWithoutbottomRight.append(elem)
    }
}
print(arrayWithoutbottomRight)

//7. დაბეჭდე ელემენტები მანამ სანამ არ შეგვხვდება bottom.
newStringArray.forEach { elem in
    if elem != "bottom" {
        print(elem)
    }
}

//8. გამოტოვე ელემენტები მანამ სანამ არ შეგვხვდება bottomRight და დაბეჭდეთ დანარჩენი.



//9. გაიგე ყველა bottom ელემენტის ინდექსი.
