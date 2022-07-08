import UIKit

// შექმენით extension String ტიპისთვის, რომელიც აბრუნებს მნიშვნელობებს:

extension String {
    
    // რამდენი ხმოვანია
    
    var vowelCount: Int {
        let vowels = ["a", "e", "i", "o", "u"]
        return self.filter { vowels.contains(String($0)) }.count
    }
    
    // რამდენი თანხმოვანია
    
    var consonantCount: Int {
        let vowels = ["a", "e", "i", "o", "u"]
        return self.filter { !vowels.contains(String($0)) }.count
    }

    // შებრუნებულ სტრიქონს
    
    var reversed: String {
        String(self.reversed())
    }
    
    // isUppercased
    
    var isUppercased: Bool {
        self == self.uppercased()
    }
    
}

// Test

let word = "asdflasdk"
print("ხმოვნების რაოდენობა: \(word.vowelCount)")
print("თანხმოვნების რაოდენობა: \(word.consonantCount)")
print("შებრუნებული სტრინგი: \(word.reversed)")
print("isUppercased: \(word.isUppercased)")
