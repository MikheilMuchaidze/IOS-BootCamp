import UIKit

var greeting = "Hello, playground"

enum LoginError: Error {
    case nameError
    case passwordError
}

func canUserLogInWithData(name: String, password: String) throws -> Bool {
    if name.isEmpty { throw LoginError.nameError }
    if password.isEmpty { throw LoginError.passwordError }
    return true
}


do {
    let firstTry = try canUserLogInWithData(name: "", password: "38638426384")
} catch {
    print("🔴")
    print(error)
}
