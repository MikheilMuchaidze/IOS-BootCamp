//: [Previous](@previous)

import Foundation

struct Person {
    var age = 17
    var activity: Activity?
}


struct Activity {
    let game: Game?
    let other = "read books"
}

enum ArtOfGame: String {
    case soccer
}

struct Game {
    let name = ArtOfGame(rawValue: "soccer")
}
let game1 = Game()
game1


let activity = Activity(game: Game())

let person = Person(age: 17, activity: activity)

print(person.activity?.game?.name?.rawValue)


//: [Next](@next)

