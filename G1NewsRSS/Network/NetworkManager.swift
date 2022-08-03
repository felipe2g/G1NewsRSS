//
//  NetworkManager.swift
//  G1NewsRSS
//
//  Created by Felipe Guimarães on 03/08/22.
//

import Foundation
import XMLParsing

enum ResultNewsError: Error {
    case badURL, noData, invalidJSON
}

class NetworkManager {
    // Using singleton pattern to share this method for outside
    static let shared = NetworkManager()
    
    struct Constants {
        static let G1API = URL(string: "https://g1.globo.com/rss/g1/carros/")
    }
    
    private init() { }
    
    func getNewsFromApi(completion: @escaping (Result<Rss, ResultNewsError>) -> Void ) {
        // Setup url
        guard let url = Constants.G1API else {
            completion(.failure(.badURL))
            return
        }
                            
        // Create a configuration
        let configuration = URLSessionConfiguration.default
        
        // Create a session
        let session = URLSession(configuration: configuration)
        
        // Create the task
        let task = session.dataTask(with: url) { (data, response, error) in
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200, let data = data else {
                completion(.failure(.invalidJSON))
                return
            }
            
            do {
                let decoder = XMLDecoder()
                let result = try decoder.decode(Rss.self, from: data)
                completion(.success(result))
            } catch {
                print("Error info: \(error)")
                completion(.failure(.noData))
            }
        }
        
        task.resume()
    }
}
