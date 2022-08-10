//
//  Models.swift
//  Networking
//
//  Created by Vasili Baramidze on 10.08.22.
//

import Foundation
import UIKit

struct Follower: Codable {
    let login: String
    let id: Int
    let site_admin: Bool
}


struct MemesResponseData: Codable {
    let success: Bool
    let data: DataModel
}

struct DataModel: Codable {
    let memes: [Meme]
}

struct Meme: Codable {
    let id: String
    let name: String
    let url: String
    let width: Int
    let height: Int
    let box_count: Int
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
