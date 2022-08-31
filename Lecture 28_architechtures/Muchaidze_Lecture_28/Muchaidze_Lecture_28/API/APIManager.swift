import Foundation

final class APIManager {
    
    func fetchData<T: Decodable>(urlString: String, query: [URLQueryItem]?, decodingType: T.Type) async throws -> T {
        
        let session = URLSession.shared
        
        var urlComponents = URLComponents(string: urlString)
        
        if query != nil {
            urlComponents?.queryItems = query
        }
        
        guard let url = urlComponents?.url else { throw ApiError.invalidUrlError }
        
        let (data, response) = try await session.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else { throw ApiError.requestError }
        
        do {
            return try JSONDecoder().decode(decodingType.self, from: data)
        } catch {
            throw ApiError.decodingError
        }
    }
    
    
}
