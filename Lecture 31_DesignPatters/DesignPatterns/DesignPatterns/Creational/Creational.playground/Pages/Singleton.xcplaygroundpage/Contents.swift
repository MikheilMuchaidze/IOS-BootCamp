/*:
 [Previous](@previous)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Next](@next)
 
 # Singleton
 - - - - - - - - - -
 ![Singleton Diagram](Singleton_Diagram.png)
 
  Singleton pattern კლასს ზღუდავს რომ ჰქონდეს მხოლოდ ერთი ინსტანსი
    
  
 */
import UIKit

// MARK: - Singleton

class SomeSingletonClass {
    static let shared = SomeSingletonClass()
    private init() { }
}

let singleton = SomeSingletonClass.shared
//let singleton = SomeSingletonClass()



/*:

![Singleton Diagram](singletonExamples.png)

*/
