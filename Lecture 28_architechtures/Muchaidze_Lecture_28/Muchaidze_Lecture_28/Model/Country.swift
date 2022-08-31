import Foundation

struct City: Decodable {
    
    struct Temp: Decodable {
        let temp: Double
    }
    
    let name: String
    let main: [Temp]
    
}
