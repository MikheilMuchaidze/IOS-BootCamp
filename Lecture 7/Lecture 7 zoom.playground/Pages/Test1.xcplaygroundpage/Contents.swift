//შექმენით extension string ტიპისთვის რომელიც აბრუნებს მნიშვნელობას შეიცავს თუ არა ორ ერთნაირ სიმბოლოს.

import Foundation

extension String {
    func checkForDublicates() -> String {
        for i in 0...self.count {
            if self[i] == self[i+1]{
                return
            }
        }
        
    }


}

let a = "de23dss"

//შექმენით int ის extension რომელიც დაგიბრუნებთ მნიშვნელობას არის თუ არა  რიცხვი დადებითი.
