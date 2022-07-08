import Foundation
/*
 4. დააგენერირეთ ანბანის მასივის შემთხვევითი წევრებისგან 30 წევრიანი მასივი სადაც არ იქნება შემდეგი ასოები: - D, E, და Q და დააბრუნეთ true თუ მასივი შეიცავს C-ს.
 */
let alphabet = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]

// შევქმნათ მასივი map ის გამოყენებით
var alphabetArray: [String] = (0..<30).map { _ in alphabet[Int.random(in: 0..<26)] }

//  ფუნქცია რომელიც დაგვიბრუნებს Bool მნიშვნელობას იმის მიხედვით შეიცავ თუ არა გადაცემული მასივი კონკრეტულ ელემენტს

func checkContains(array str: [String], symbol c: String) -> Bool {
    str.map { $0.lowercased() }.contains("c")
}

print("This Array : \(alphabetArray) \nContains symbol 'C' is: \(checkContains(array: alphabetArray, symbol: "C"))")
