/*:
 # Functions
 */
import Foundation
import PlaygroundSupport
defer { PlaygroundPage.current.finishExecution() }

/*:
   - ფუნქციის შექმნა და გამოძახება
   - პარამეტრიანი და უპარამეტრო ფუნქცია
   - ფუნქცია დასაბრუნებელი მნიშვნელობით
   - ფუნქცია რამდენიმე დასაბრუნებელი მნიშვნელობით
   - Default პარამეტრები
   - ფუნქციის პარამეტრების სახელების აღწერა
   - inout პარამეტრი
   - ფუნქცია როგორც პარამეტრი
 ---
 */


result(for: "ფუნქცია რომელიც დაბეჭდავს, მე მსურს გავხდე iOS დეველოპერი") {
    func someInforAboutMe() {
        print("მე მსურს გავხდე iOS დეველოპერი")
    }
    someInforAboutMe()
    someInforAboutMe()
}

result(for: "ფუნქცია რომელიც პარამეტრად მიიღებს პროფესიას") {
    func someInforAboutMe(profession: String, age: Int) {
        print("მე მსურს \(age) წლის შემდეგ გავხდე \(profession)")
    }
    
    someInforAboutMe(profession: "iOS dev.", age: 20)
    someInforAboutMe(profession: "soccer player", age: 17)
    someInforAboutMe(profession: "Adad", age: 222)
}

result(for: "შექმენით ფუნქცია რომელიც დააბრუნებს წინადადებას - მე მსურს გავხდე iOS დეველოპერი -") {
    func someInforAboutMe() -> String {
        return "მე მსურს გავხდე iOS დეველოპერი"
    }
    
    let k = someInforAboutMe()
    print(k)
    
}

result(for: "შექმენით ფუნქცია რომელიც მიიღებს ტექსტურ ჩანაწერს და დააბრუნებს ორ მნიშვნელობას(მაღალი რეგისტრის ტექსტი და დაბალი რეგისტრის ტექსტი)") {
    func textForProccess(text: String) -> (uppercased: String, lowercased: String) {
        return (text.uppercased(),text.lowercased())
    }
    
    let s = textForProccess(text: "me minda gavxde developeri")
    print(s)
    
}

//🙋‍♀️🙋‍♂️
result(for: "დაბეჭდეთ მასივის ყოველ კენტ ინდექსზე მყოფი ელემენტი") {
    
    func printAllElementsOnEvenIndex(numbers: [Int]) {
        for index in 0...numbers.count-1 {
            if index % 2 == 1 {
                print(numbers[index])
            }
        }
    }
    let nums = [1,3,34,343,54,5456,56]
    printAllElementsOnEvenIndex(numbers: nums)
    printAllElementsOnEvenIndex(numbers: [1,2,3,4,5])

}

result(for: "დაბეჭდეთ მასივის ელემენტების საშუალო") {
    func sashualoOfInts(masivi: [Int]) -> Int {
        let sumOfNums = masivi.count
        var sum = 0
        for i in 0...masivi.count-1 {
            sum += masivi[i]
        }
        let sashualo = sum / sumOfNums
        return sashualo
    }
    let nums = [23123,12312,32131,313,2,44,123,4]
    print(sashualoOfInts(masivi: nums))

    
    
    
}


result(for: "შექმენით ფუნქცია Default პარამეტრით") {
    func printMyFavorite(number: Int = 8) {
        print("my fav. number is \(number)")
    }
    printMyFavorite(number: 7)
    printMyFavorite()
}



result(for: "ფუნქციის პარამეტრების სახელების აღწერა") {
    func printMy(_ text: String) {
        print("ჩემი სახელი არის \(text)")
    }
    
    printMy("sahs")
    
}

result(for: "შექმენით ორი ცვლადი და ფუნქციის მნიშვნელობით მათ გაუცვალეთ მნიშვნელობები(inout)") {
    var number1 = 17
    var number2 = 19
    
    func swapValues(num1: inout Int, num2: inout Int) {
        let tempNumber = num1
        num1 = num2
        num2 = tempNumber
    }
    
    swapValues(num1: &number1, num2: &number2)
    
    print("num1 = \(number1), num2 = \(number2)")
}


result(for: "ფუნქცია როგორც პარამეტრი") {
    func isFirstGreaterThanLast(array: [Int])-> Bool{
        if array.count > 1 {
            return array[0] > array[array.count-1]
        } else {
            return false
        }
    }

    func hasArrayMoreThanFiveElements(array: [Int])-> Bool{
        return array.count > 5
    }
    
    func mainFuncFor(array: [Int], function: ([Int]) -> Bool)->Bool {
        return function(array)
    }
    
    print(mainFuncFor(array: [77,2,6,76], function: hasArrayMoreThanFiveElements))
    
}

result(for: "ჩაშენებული ფუნქციები") {
    
    func getMyName() {
        func printSomeText() {
            print("🟢")
        }
        printSomeText()
    }
    let k = getMyName()
    print(k)
}
//🙋‍♀️🔁🙋‍♂️



//:[Closure 👉](@next)
