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


let personsDataString = """
[
  {
    "personal_info": {
      "name": "george",
      "age": 16,
      "gender": "Male"
    },
    "hobby": {
      "category": "sport",
      "name": "Basketball"
    }
  },
  {
    "personal_info": {
      "name": "Steven",
      "age": 26,
      "gender": "Male"
    },
    "hobby": [
      {
        "category": "sport",
        "name": "Basketball"
      },
      {
        "category": "music",
        "name": "pop music"
      }
    ]
  },
  {
    "personal_info": {
      "name": "Ann",
      "age": 36,
      "gender": "Female"
    },
    "hobby": {
      "category": "cognition",
      "name": "reading books"
    }
  }
]
"""


struct Person: Codable {
    enum CodingKeys: String, CodingKey {
        case about = "personal_info"
        case hobby
    }
    
    enum Gender: String, Codable {
        case Male, Female
    }
    
    struct About: Codable {
        let name: String
        let age: Int
        let gender: Gender?
    }

    struct Hobby: Codable {
        let category: String
        let name: String
    }

    let about: About
    var hobby: [Hobby]!
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        about = try container.decode(About.self, forKey: .about)
        hobby = try? container.decode([Hobby].self, forKey: .hobby)
    }
}

let data = personsDataString.data(using: .utf8)!

let jspndata = try! JSONDecoder().decode([Person].self, from: data)

for item in jspndata {
    print(item.about.gender == .Male)
}

