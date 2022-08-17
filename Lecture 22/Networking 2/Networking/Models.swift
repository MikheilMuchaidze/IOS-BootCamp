//
//  Models.swift
//  Networking
//
//  Created by Vasili Baramidze on 10.08.22.
//

import Foundation
import UIKit

struct Follower: Codable {
    
    enum CodingKeys: String, CodingKey  {
        case admin = "site_admin"
        case id
        case login
    }
    
    let login: String
    let id: Int
    let admin: Bool
}


struct MemesResponseData: Codable {
    
    struct DataModel: Codable {
        
        struct Meme: Codable {
            
            let id: String
            let name: String
            let url: String
            let width: Int
            let height: Int
            let box_count: Int
        }
        
        let memes: [Meme]
    }
    
    let success: Bool
    let data: DataModel
}

extension UIImageView {
    
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
