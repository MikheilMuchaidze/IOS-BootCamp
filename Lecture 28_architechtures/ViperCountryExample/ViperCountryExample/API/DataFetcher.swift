//
//  DataFetcher.swift
//  Countries_VIPER
//
//  Created by Vasili Baramidze on 28.08.22.
//  Copyright © 2022 Vasili Baramidze. All rights reserved.
//

import Foundation

enum NetworkError: Int, Error {
    case noResponse = 0,
         httpStatusCodeError,
         noData,
         failedParse
}

class DataFetcher {
    
    let session = URLSession.shared
    
    static let shared = DataFetcher()
    
    func fetch<T: Codable>(
        with urlString: String,
        as model: T.Type,
        onSuccess: @escaping (T) -> Void,
        onError: @escaping (Error) -> Void
    ) {
        let url = URL(string: urlString)
        
        session.dataTask(with: url!, completionHandler: {(data, response, error) in
            
            if let error = error {
                onError(error)
                return
            }
            
            if let responseError = DataFetcher.check(response: response) {
                onError(responseError)
                return
            }
            
            guard let data = data else {
                onError(NetworkError.noData)
                return
            }
            
            let decoder = JSONDecoder()
            
            do {
                let fetchedData = try decoder.decode(model, from: data)
                DispatchQueue.main.async {
                    onSuccess(fetchedData)
                }
            } catch {
                print("parsing error")
                onError(NetworkError.failedParse)
            }
        }).resume()
    }
    
    
    static func createError(_ code: NetworkError, _ info: [String: Any]?) -> NSError {
        return NSError(domain: "ApiError", code: code.rawValue, userInfo: info)
    }

    static func check(response: URLResponse?) -> NSError? {
        
        guard let notNilResponse = response else {
            return createError(.noResponse, nil)
        }

        let httpResponse = notNilResponse as! HTTPURLResponse
        
        guard (200..<300) ~= httpResponse.statusCode else {
            return createError(.httpStatusCodeError, ["code": httpResponse.statusCode])
        }
        
        return nil
    }
}
