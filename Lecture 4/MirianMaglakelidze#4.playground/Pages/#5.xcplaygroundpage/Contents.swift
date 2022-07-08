import Foundation
/*
 5. მოცემულია tuple-ების მასივი let people = [(name: ვაჟა, age: 22), (name: მურთაზი, age: 12), (name: შუქური, age: 12), (name: დინარა, age:19), (name: ფრიდა, age:88)] სკოლის ასაკი არის 6 - 18 წლამდე. გამოითვალეთ სკოლის მოსწავლეების საშუალო ასაკი.
 */

let people = [
    (name: "ვაჟა", age: 22),
    (name: "მურთაზი", age: 12),
    (name: "დინარა", age:19),
    (name: "ფრიდა", age:88),
    (name: "მურთაზი", age: 6),
    (name: "მურთაზი", age: 7),
    (name: "მურთაზი", age: 7),
    (name: "მურთაზი", age: 7)
]
// გავფილტროთ მოცემული მასივიდან სკოლის ასაკის ბავშვები
let schoolAgePeople = people.filter { 6...18 ~= $0.age }

//დავითვალოთ საშუალო ასაკი სკოლის მოსწავლეებში
let averageAgeOfSchoolPeople = schoolAgePeople.reduce(0) { $0 + $1.age } / schoolAgePeople.count
print("School People's \(schoolAgePeople) \nAverage Age Is: \(averageAgeOfSchoolPeople)")
    


