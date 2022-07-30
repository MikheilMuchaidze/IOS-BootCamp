import UIKit
import Foundation

public class Users {
    var username: String
    let password: String
    let repeatedPassword: String
    let email: String
        
    init(username: String, password: String, repeatedPassword: String, email: String) {
        self.username = username
        self.password = password
        self.repeatedPassword = repeatedPassword
        self.email = email
  }
}

public var usersList = [Users]()
