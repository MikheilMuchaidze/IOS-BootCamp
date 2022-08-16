import Foundation
import UIKit

class NetworkCall {
    
    //get data from lecture
    func getData<T: Codable>(with urlString: String, completionHandler: @escaping (T) -> (Void)) {
        
        var urlComponents = URLComponents(string: urlString)
        
        urlComponents?.queryItems = [
            URLQueryItem(name: "api_key", value: "c78b72820646a4860d6b67948bccc37f")
        ]
        
        guard let url = urlComponents?.url else {
            print("Problem with URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print(error!.localizedDescription)
                return
            }
            
            guard let data = data else {
                print("data error")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let dataSummary = try decoder.decode(T.self, from: data)
                DispatchQueue.main.async {
                    completionHandler(dataSummary)
                }
            } catch {
                print(error.localizedDescription)
            }
        }
        
        task.resume()
    }
    
    //get data from lecture
    func getDataWithID<T: Codable>(with urlString: String, with ID: String, completionHandler: @escaping (T) -> (Void)) {
        
        var urlComponents = URLComponents(string: urlString)
        
        urlComponents?.queryItems = [
            URLQueryItem(name: "api_key", value: "c78b72820646a4860d6b67948bccc37f"),
            URLQueryItem(name: "tv_id", value: ID)
        ]
        
        guard let url = urlComponents?.url else {
            print("Problem with URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print(error!.localizedDescription)
                return
            }
            
            guard let data = data else {
                print("data error")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let dataSummary = try decoder.decode(T.self, from: data)
                DispatchQueue.main.async {
                    completionHandler(dataSummary)
                }
            } catch {
                print(error.localizedDescription)
            }
        }
        
        task.resume()
    }

}

