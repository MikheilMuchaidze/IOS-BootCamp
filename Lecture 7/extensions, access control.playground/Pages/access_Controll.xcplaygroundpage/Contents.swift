//: [Previous](@previous)
import Foundation




/*:
 * Important:
   * private
   * fileprivate
   * internal
   * public
   * open โ ๏ธ
 ---
 */








/*:
 ๐ ACFile แจแ แจแแฅแแแแแ แแแแกแ Player  (name, salary,countOfYellowCards)
 
 ๐ ACFile1 แจแ แจแแฅแแแแแ แแแแกแ Referee (players)
 
 ๐ ACFile แจแ แแแแแแขแแ แแแแกแ Scout (players)
 
 ๐ ACFile แจแ แแแแแแขแแ แแแแกแ Club (players)

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
 >struct - แแก memberwise init
 >แแ แแก แแแขแแแแขแฃแ แแ internal แขแแแแก แแ แกแญแแ แแแแ public init แคแฃแแฅแชแแแก แแแแแขแแแ
 */

