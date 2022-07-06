//
//  BaseService.swift
//  MovieApp
//
//  Created by omer faruk bozbulut on 6.07.2022.
//

import Foundation

class BaseService {
    
    static let shared = BaseService()
    
    init(){}
    
    func parseJSON<T: Decodable>(type: T.Type,
                                 data: Data,
                                 completion: @escaping (Result<T,baseError>)->Void) {
        do {
            let decodedData: T = try JSONDecoder().decode(T.self, from: data)
            completion(.success(decodedData))
        }
        catch {
            completion(.failure(.failure))
        }
    }
}

enum baseError :Error {
    case success
    case failure
}
