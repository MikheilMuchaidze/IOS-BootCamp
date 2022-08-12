import Foundation

public struct Country: Decodable {
    let name: String
    let capital: String?
    let population: Int?
    let flag: String?
}




public var countriesList = [Country]()
public var filteredCountriesList = [Country]()

