import Foundation

class Player {
    internal let name: String?
    fileprivate let salary: Int
    let countOfYellowCards = 0
    
    init(name: String, salary: Int) {
        self.name = name
        self.salary = salary
    }
}


public class Scout {
    let players: [Player] = []

    func getSalaryOfAllPlayers() {
        for player in players {
            print(player.salary)
        }
    }
}
