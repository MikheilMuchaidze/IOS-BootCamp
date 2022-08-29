//: [Previous](@previous)
import Foundation




/*:
 * Important:
   * private
   * fileprivate
   * internal
   * public
   * open ⚠️
 ---
 */








/*:
 📁 ACFile ში შექმენით კლასი Player  (name, salary,countOfYellowCards)
 
 📁 ACFile1 ში შექმენით კლასი Referee (players)
 
 📁 ACFile ში დაამატეთ კლასი Scout (players)
 
 📁 ACFile ში დაამატეთ კლასი Club (players)

 */

let player = Player(name: "messi", salary: 20_000)

print(player.name)
print(player.games.first?.minutes)

let playerScout = Scout(player)




public struct Game {
    public let minutes: Double
    let goals: Int?
    
    
    init() {
        minutes = 12
        goals = 1
    }
}


let schs = Game(





































/*:
 >struct - ის memberwise init
 >არის ავტომატურად internal ტიპის და სჭირდება public init ფუნქციის დამატება
 */

