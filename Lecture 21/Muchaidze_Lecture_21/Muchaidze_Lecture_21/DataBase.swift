import Foundation

public struct Country: Decodable {
    let name: String
    let capital: String?
    let population: Int?
    let flags: Flags
}

struct Flags: Decodable {
    let svg: URL
    let png: URL
}



public var countriesList = [Country]()
public var filteredCountriesList = [Country]()

