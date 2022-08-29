import UIKit

var greeting = "Hello, playground"

class Sport {
    var player: Player?
    var name: String
    
    init(player: Player?,name: String) {
        self.player = player
        self.name = name
    }
    
    deinit {
        print("Soccer class is deallocated")
    }
}

class Player {
    var name: String
    var sport: Sport?
    var number: Int

    init(name: String, sport: Sport?, number: Int) {
        self.name = name
        self.sport = sport
        self.number = number
    }
    
    deinit {
        print("Player is deallocated")
    }
}


//1
var player1: Player? = Player(name: "Messi", sport: nil, number: 10)
var soocer: Sport? = Sport(player: nil, name: "soccer")
//2
var player2 = player1
//3
var player3 = player2
//4
var player4 = player3

player1 = nil
player2 = nil
player2 = nil
player4 = nil
