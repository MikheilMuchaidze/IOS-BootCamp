//: [Previous](@previous)

var allNumbers = [1,2,-3,4,-5,6,78,-9,0,10]



//წაშალეთ ყველა უარყოფითი რიცხვი

allNumbers.removeAll { $0.isMultiple(of: 2) }


/*:
 >Dictionary ს შემთხვევაში არ გვაქვს remove all by condition
 */

var monitorsByInches = [
    "sony" : 25.0,
    "samsuns" : 30.0,
    "siemens" : 28.0,
    "viewsonic" : 25.0
]

monitorsByInches = monitorsByInches.filter { key,value in
    key == "sony"
}


print(monitorsByInches)


//: [Next](@next)
