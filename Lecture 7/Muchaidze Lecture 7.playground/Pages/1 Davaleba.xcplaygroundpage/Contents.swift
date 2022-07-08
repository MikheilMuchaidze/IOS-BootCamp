import UIKit
import Darwin
import Foundation
//დავალება #1
//შექმენით extension String ტიპისთვის, რომელიც აბრუნებს მნიშვნელობებს:
//რამდენი ხმოვანია
//რამდენი თანხმოვანია
//შებრუნებულ სტრიქონს
//isUppercasedMore


let testString1 = "xmovnebis shemowmeba"
let testString2 = "grdzeli striqoni shesabruneblad"
let testString3 = "diDi da PAtaRa aSOEbis Shemowmeba"

extension String {
    //ხმოვნებზე შემოწმება
    func checkForVowels() -> Int {
        var count = 0
        let vowels: [Character] = ["a", "e", "i", "o", "u"]
        
        self.lowercased().forEach { elem in
            if vowels.contains(elem) {
                count += 1
            }
        }
        
        return count
    }
    
    //ხმოვნების ბეჭდვა
    func vowelsList() -> Array<String> {
        var vowelArray = [String]()
        let vowels: [Character] = ["a", "e", "i", "o", "u"]
        
        self.lowercased().forEach { elem in
            if vowels.contains(elem) {
                vowelArray.append(String(elem))
            }
        }
        
        return vowelArray
    }
    
    //თანხმოვნებზე შემოწმება
    func checkForConsonants() -> Int {
        var count = 0
        let vowels: [Character] = ["a", "e", "i", "o", "u"]
        
        self.lowercased().forEach { elem in
            if !vowels.contains(elem) {
                count += 1
            }
        }
        
        return count
    }
    
    //თანხმოვნების ბეჭდვა
    func consonantsList() -> Array<String> {
        var consonantArray = [String]()
        let vowels: [Character] = ["a", "e", "i", "o", "u"]
        
        self.lowercased().forEach { elem in
            if !vowels.contains(elem) {
                consonantArray.append(String(elem))
            }
        }
        
        return consonantArray
    }
    
    //სტრიქონის შებრუნება
    func stringReverse() -> String {
        String(self.reversed())
    }
    
    //ვეძებთ სტრიქონში თუ არის მაღალ რეგისტრში ასოები და ვაბრუნებთ true-ს თუ არის
    func checkForUpperRegistry() -> Bool {
        self.contains { elem in
            elem.isUppercase
        }
    }
    
    //ვეძებთ სტრიქონში თუ არის მაღალ რეგისტრში ასოები და ვბეჭდავთ მათ
    func checkUpperCase() -> Bool {
        self != self.uppercased()
    }
}

//რამდენი ხმოვანია
print("sawyisi String mnishvneloba - \(testString1)")
print("sawyisi mnishvnelobashi xmovnebis raodenoba: \(testString1.checkForVowels())")
print("sawyisi mnishvnelobashi xmovnebia: \(testString1.vowelsList())")
print("")
//რამდენი თანხმოვანია
print("sawyisi String mnishvneloba - \(testString1)")
print("sawyisi mnishvnelobashi xmovnebis raodenoba: \(testString1.checkForConsonants())")
print("sawyisi mnishvnelobashi xmovnebia: \(testString1.consonantsList())")
print("")
//შებრუნებულ სტრიქონს
print("sawyisi String mnishvneloba - \(testString2)")
print("zeda sawyisi String mnishvnelobis shebrunebuli: \(testString2.stringReverse())")
print("")
//isUppercasedMore
print("sawyisi String mnishvneloba - \(testString3)")
print("aqvs tu ara zeda strings magal registrshi mnishvnelobebi?: \(testString3.checkUpperCase())")
print("")



