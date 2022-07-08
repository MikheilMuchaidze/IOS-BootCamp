//: [Previous](@previous)

import Foundation
//შექმენით სტრუქტურა მოთამაშის name,number ცვლადებით.
//შექმენით ობიექტი
struct Player {
    let name: String
    var number: Int
    
    init(name: String, number: Int) {
        self.name = name
        self.number = number
    }
    
    mutating func changeNumber(new number: Int) {
        self.number = number
    }
}

let player1 = Player(name: "name1", number: 9)
var player2 = player1

player2.number = 12
player2.changeNumber(new: 9)
player2.number


print(player1.number)
print(player2.number)


/*:
 >თუ სტრუქტურას შეუქმნით ინიციალიზატორს \
 >ავტომატური ინიციალიზატორი გაუუქმდება
 */




//განსხვავება reference და value ტიპებს შორის.


//mutating



//: [Next](@next)


