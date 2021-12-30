//
//  NetworkManager.swift
//  NeteaseCloudMusic-homepage-swift
//
//  Created by Anlesu on 2021/12/16.
//

import Foundation
import Alamofire

enum MethodType {
    case get
    case post
}

enum NetworkError: Error {
    case invalidResponse
    case nilResponse
}

class NetworkManager<T: Codable> {
    static func requestData(_ type: MethodType,
                            URLString: String,
                            parameters: [String: Any]?,
                            completion: @escaping (Result<T, NetworkError>) -> Void) {
        let method = type == .get ? HTTPMethod.get : HTTPMethod.post
        AF.request(URLString, method: method, parameters: parameters, encoding: URLEncoding.httpBody, headers: nil, interceptor: nil).validate().responseDecodable(of: T.self) { response in
           
            if let value = response.value {
                completion(.success(value))
                return
            }
            
            if response.error != nil {
                completion(.failure(.invalidResponse))
                return
            }
            
            completion(.failure(.nilResponse))
        }
       
    }
    
}
