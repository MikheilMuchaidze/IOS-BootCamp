// Please, don't mind this :')
let array = [1,5,2,9,-10,-50,90]


let cars = [
    (name: "Mercedes", price: 40000),
    (name: "BMW", price: 10000),
    (name: "Mazda", price: 20000),
    (name: "Toyota", price: 50000),
]

cars.sorted { pairLeft, pairRight in
    print("L:",pairLeft, terminator: " -> ")
    print("R:",pairRight)
    print("State:", cars)
    return pairLeft.price > pairRight.price
}

let name = "Nikolozi"

print(name[name.index(name.startIndex, offsetBy: 2)])
