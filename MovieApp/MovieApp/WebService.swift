//
//  WebService.swift
//  MovieApp
//
//  Created by omer faruk bozbulut on 8.07.2022.
//

import Foundation

class WebSerice {
    
    static let shared = WebSerice()
    
    init(){}
    
    func fetchData<T: Decodable>(of type: T.Type, url: URL, completion: @escaping (Result<T, Error>) -> ()) {
        
        let urlSession = URLSession(configuration: .default)
        
        urlSession.dataTask(with: url) { data, response, error in
            guard error == nil else {
                completion(.failure(NetworkError.networkError))
                return
            }
            
            let statusCode = (response as? HTTPURLResponse)?.statusCode
            guard
                let code = statusCode,
                (200..<300) ~= code
            else {
                completion(.failure(NetworkError.serverError(statusCode: statusCode)))
                return
            }
            
            guard let data = data else {
                completion(.failure(NetworkError.noDataReceived))
                return
            }
            
            do  {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedData))
            }
            catch {
                guard let decodingError = error as? DecodingError else {
                    completion(.failure(NetworkError.unknowError(error)))
                    return
                }
                completion(.failure(NetworkError.decodingError(decodingError)))
            }
        }
        .resume()
    }
    
    
    
    enum NetworkError: Error {
        case networkError
        case serverError(statusCode: Int?)
        case noDataReceived
        case unknowError(Error)
        case decodingError(DecodingError)
    }
}
