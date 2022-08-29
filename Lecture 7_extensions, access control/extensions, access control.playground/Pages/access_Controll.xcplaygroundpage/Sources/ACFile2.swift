import Foundation

public class Player {
    public let name: String?
    private(set) public var salary: Int
    let countOfYellowCards = 0
    public var games = [
        Game(minutes: 100, goals: 4)
    ]
    
    var allGoals: Int {
        games.reduce(into: 0) { currentSum, gameResult in
            currentSum += gameResult.goals
        }
    }
    
    var allMinutes: Double {
        games.reduce(into: 0) { currentSum, gameResult in
            currentSum += gameResult.minutes
        }
    }
    
    public init(name: String, salary: Int) {
        self.name = name
        self.salary = salary
    }
 
    public func minutePerGoal()->Double {
        allMinutes / Double(allGoals)
    }
    
    func changeSalary(by amount: Int) {
        if amount > salary {
            salary = amount
        }
    }
}

public struct Game {
    public let minutes: Double
    let goals: Int
}
//
//public class Scout {
//    let players: [Player] = []
//
//    func getSalaryOfAllPlayers() {
//        for player in players {
//            print(player.salary)
//        }
//    }
//}



class Club {
    let players: [Player] = []

    func showSalary() {
        let salaryOfFirstPlayer = players.first!.salary
        players.first!.changeSalary(by: 500)
    }
}
