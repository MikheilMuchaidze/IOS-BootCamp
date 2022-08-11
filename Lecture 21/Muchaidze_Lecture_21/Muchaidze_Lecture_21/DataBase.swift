import Foundation

public struct Counrtry: Decodable {
    let name: String?
    let capital: String?
//        let area: Int?
    let flag: String?
}


public var countriesList = [Counrtry]()

