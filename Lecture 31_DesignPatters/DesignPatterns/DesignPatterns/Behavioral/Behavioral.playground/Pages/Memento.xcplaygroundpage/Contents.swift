/*:
 [Previous](@previous)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Next](@next)
 
 # Memento
 - - - - - - - - - -
 ![Memento Diagram](Memento_Diagram.png)
 
memento pattern გამოიყენება მონაცემების შესანახად და აღსადგენად. იგი შედგება სამი კომპონენტისგან
 
 - Originator ქმნის Memento ს, რომელიც არის ობიექტი რომელიც უნდა იქნეს შენახული/აღდგენილი Caretaker ის მიერ.
 
 - Memento მდგომარეობის შემნახველი ობიექტი
 
 - Caretaker პასუხისმგებელია Memento შენახვაზე, საჭიროების შემთხვევაში მას შეუძლია დაუბრუნოს originator-ს წინანდელი მნიშვნელობა არსებულ მემენტოზე დაყრდნობით.
 */


import Foundation

// MARK: - Originator
class Originator {

    private var amount: Int

    init(amount: Int) {
        self.amount = amount
        print("შეიქმნა \(amount)")
        print("\n")
    }
    
    func edit() {
        print("\(amount) იცვლება")
        amount = Int.random(in: 1...1000)
        print("\(amount) - ით")
        print("\n")
    }

    func create() -> MementoProtocol {
        return MementoObject(amount: amount)
    }

    func restore(memento: MementoProtocol) {
        guard let memento = memento as? MementoObject else { return }
        print("\(amount) მნიშვნელობა")
        self.amount = memento.amount
        print("დაუბრუნდა \(amount) მნიშვნელობას")
    }
}


// MARK: - Memento Protocol
protocol MementoProtocol {
    var amount: Int { get }
}

// MARK: - Memento
class MementoObject: MementoProtocol {

    private(set) var amount: Int

    init(amount: Int) {
        self.amount = amount
    }

}


// MARK: - CareTaker
class Caretaker {

    private var mementos = [MementoProtocol]()
    private var originator: Originator

    init(originator: Originator) {
        self.originator = originator
    }

    func save() {
        mementos.append(originator.create())
    }

    func undo() {
        guard !mementos.isEmpty else { return }
        let removedMemento = mementos.removeLast()
        originator.restore(memento: removedMemento)
    }

    func showAllValues() {
        mementos.forEach({ print($0.amount) })
    }
}

let originator = Originator(amount: 7)
let caretaker = Caretaker(originator: originator)
caretaker.save()

originator.edit()
caretaker.save()

originator.edit()
caretaker.save()

originator.edit()
caretaker.save()


print("-----------ისტორია-----------------")
caretaker.showAllValues()
print("--------------------------------")
caretaker.undo()
caretaker.undo()
caretaker.undo()
caretaker.undo()
