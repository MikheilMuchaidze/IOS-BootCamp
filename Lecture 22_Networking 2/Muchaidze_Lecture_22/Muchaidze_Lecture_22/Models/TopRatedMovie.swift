import UIKit

struct MovieResponse: Codable {
    
    struct Movie: Codable {
        let name: String
        let id: Int
        let vote_average: Double
        let vote_count: Int
    }
    
    let results: [Movie]
}


