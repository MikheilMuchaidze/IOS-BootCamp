import UIKit
import PlaygroundSupport
defer { PlaygroundPage.current.finishExecution() }

var age = Int.random(in: 6...100)
print(age)

if(age > 6 &&  age < 18){
    print(age, "kid")
}
else if(age >= 18 &&  age < 65){
    print(age, "adult")
}
else{
    print(age, "old")
}

