//import PlaygroundSupport
//defer { PlaygroundPage.current.finishExecution() }


public func result(for exercise: String, action: () -> Void) {
    print("ამოცანა: \(exercise)")
    print("------------------------------")
    action()
    print("\n")
    print()
}
