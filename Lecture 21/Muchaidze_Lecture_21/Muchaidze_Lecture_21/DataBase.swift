import Foundation

public struct Country: Decodable {
    
    struct Flags: Decodable {
        let svg: URL
        let png: URL
    }
    
    let name: String
    let capital: String?
    let population: Int?
    let flags: Flags
}





public var countriesList = [Country]()
public var filteredCountriesList = [Country]()

