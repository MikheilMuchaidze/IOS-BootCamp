import Foundation

public struct MovieResponse: Decodable {
    
    public struct Movie: Decodable {
        let name: String
        let vote_average: Double
        let vote_count: Int
    }
    
    let results: [Movie]
}


