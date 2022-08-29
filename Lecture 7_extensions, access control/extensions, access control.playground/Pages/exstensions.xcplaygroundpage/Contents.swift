import Foundation

var greeting = "Hello, playground"

//შექმენით extension string ტიპისთვის რომელიც ამოშლის ყველა ხმოვანს ლათინური ანბანით ჩაწერილ ტექსტიდან.
extension String {
    func removeVowels()-> String {
        let vowels = ["a","e","i","o","u"]
        return self.filter { char in
            !vowels.contains(String(char))
        }
    }
    
    func printFullDescription() {
        print("მნიშვნელობა არის \(self)")
    }
}

var name = "sabdk veielie"

name = name.removeVowels()

name.printFullDescription()
"sanksnkv".printFullDescription()



//შექმენით მასივის extension რომელიც დაგიბრუნებთ მასივის შუა ელემენტს
extension Array {
    var middleElement: [Element] {
        
        let indexOfMiddleLeftElement = self.count/2
        let indexOfMiddleRightElement = self.count/2-1
        
        var array = [Element]()
        
        if self.count.isMultiple(of: 2) {
            array.append(contentsOf: [self[indexOfMiddleLeftElement],self[indexOfMiddleRightElement]])
        } else {
            array.append(contentsOf: [self[indexOfMiddleLeftElement]])
        }
        return array
    }
}

var arrayOfIntegers = [1,2,3,5,6,100,200,300]
var arrayOfStrings = ["a","c","b"]

let k = arrayOfIntegers.middleElement

//შექმენით int ის extension რომელიც დაგიბრუნებთ მის მეორე ხარისხში აყვანილ მნიშვნელობას
extension Int {
    func square () {
        self*self
    }
}

5.square()


//შექმენით double  ის extension რომელიც დაგიბრუნებთ მის ტექსტურ მნიშვნელობას

extension Dictionary where Key == String, Value == Int {
    mutating func duplicateValues() {
        self.map { value,key in
            self[value] = key * 2
        }
    }
}

var dict = [
    "e":5,
    "a":7,
    "b":4
]

dict.duplicateValues()

var dict1 = [
    1:5,
    2:7,
    3:4
]
//dict1.duplicateValues()

//შექმენით dictionary(String: value) ის extension რომელიც დაგიბრუნებთ value ს გაორმაგებულს.
