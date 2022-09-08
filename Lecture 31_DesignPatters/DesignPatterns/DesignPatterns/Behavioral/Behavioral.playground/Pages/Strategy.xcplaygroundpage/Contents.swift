/*:
 [Previous](@previous)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Next](@next)
 
 # Strategy
 - - - - - - - - - -
 ![Strategy Diagram](Strategy_Diagram.png)
 
 Strategy pattern პროტოკოლის საშუალებით ქმნის ერთ ოჯახს, რომლის წერვებთან ერთი სტრატეგიით მუშაობს.
 */
import UIKit

protocol TeamRatingStrategy {
    var tournament: String { get }
    
    func getRating(for team: String,
                   rating: (_ played: Int, _ review: String) -> ())
}


class EuropeCupInfoService: TeamRatingStrategy {
    var tournament = "ევროპის ჩემპიონატი"
    
    func getRating(for team: String, rating: (Int, String) -> ()) {
        if team == "Georgia" {
            rating(0, "ახლოს ვიყავით არადა 😏")
        }
    }
}

class WorldCupInfoService: TeamRatingStrategy {
    
    var tournament = "მსოფლიო ჩემპიონატი"
    
    func getRating(for team: String, rating: (Int, String) -> ()) {
        if team == "Georgia" {
            rating(0, "ეჰჰ...")
        }
    }
}

struct TeamObject {
    // MARK: - Property
    var ratingService: TeamRatingStrategy!
    
    // MARK: - Action
    func getInfoForTeam() {
        ratingService.getRating(for: "Georgia") { wins, review in
            print(review)
        }
    }
}

let eu = EuropeCupInfoService()
let word = WorldCupInfoService()

let test = TeamObject(ratingService: eu)
test.getInfoForTeam()
