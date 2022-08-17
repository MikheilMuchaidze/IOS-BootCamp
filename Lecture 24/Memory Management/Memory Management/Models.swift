//
//  Models.swift
//  Memory Management
//
//  Created by Vasili Baramidze on 17.08.22.
//

import Foundation

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
