//
//  NetworkingManager.swift
//  CryptoApp
//
//  Created by enesozmus on 25.05.2024.
//

import Combine
import Foundation

class NetworkingManager {
    
    enum NetworkingError: LocalizedError {
        case badURLResponse(url: URL)
        case unknown
        
        var errorDescription: String? {
            switch self {
            case .badURLResponse(url: let url): return "[🔥] Bad response from URL: \(url)"
            case .unknown: return "[⚠️] Unknown error occured"
            }
        }
    }
    static func download<T>(url: URL, convertTo type: T.Type) -> AnyPublisher<T, Error> where T: Decodable {
        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap({ try handleURLResponse(output: $0, url: url) })
            .decode(type: T.self, decoder: JSONDecoder())
            .retry(3)
            .eraseToAnyPublisher()
    }
    //    static func download(url: URL) -> AnyPublisher<Data, Error> {
    //        return URLSession.shared.dataTaskPublisher(for: url)
    //            .tryMap({ try handleURLResponse(output: $0, url: url) })
    //            .retry(3)
    //            .eraseToAnyPublisher()
    //    }
    static func handleURLResponse<T>(output: URLSession.DataTaskPublisher.Output, url: URL) throws -> T where T: Decodable {
        guard let response = output.response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300 else {
            throw NetworkingError.badURLResponse(url: url)
        }
        return output.data as! T;
    }
    static func handleCompletion(completion: Subscribers.Completion<Error>) {
        switch completion {
        case .finished:
            break
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
}
