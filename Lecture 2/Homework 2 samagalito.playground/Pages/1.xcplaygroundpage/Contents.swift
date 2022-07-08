import Cocoa

var grade = Int.random(in: 1...100)

switch grade {
case _ where grade > 90:
    print("A")
case _ where grade > 80:
    print("B")
case _ where grade > 70:
    print("C")
case _ where grade > 60:
    print("D")
case _ where grade > 40:
    print("E")
case _ where grade <= 40:
    print("F")
default:
    print("There was an error")
}
print(grade)
