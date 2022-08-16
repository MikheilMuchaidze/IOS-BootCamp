import UIKit

class NetworkCall {
    
    func getDataFromAPI<T: Codable>(fromUrlString UrlString: String, complitionHandler: @escaping (T) -> (Void)) {
        
        var urlComponents = URLComponents(string: UrlString)
        
        urlComponents?.queryItems = [
            URLQueryItem(name: "api_key", value: API_DATA.API_KEY),
//            URLQueryItem(name: "language", value: "en-US"),
//            URLQueryItem(name: "page", value: "1")
        ]
        
        guard let url = urlComponents?.url else {
            print("Problem with URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                print("#1 \(error!.localizedDescription)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                print("#2 \(error!.localizedDescription)")
                return
            }
            
            guard let data = data else {
                print("Data Error !")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode(T.self, from: data)
                DispatchQueue.main.async {
                    complitionHandler(decodedData)
                }
            } catch {
                print("#3 \(error.localizedDescription)")
            }
        }
        
        task.resume()
    }
    
}
