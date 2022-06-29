//
//  NetworkManager.swift
//  FindYourEmoji
//
//  Created by Julia Romanenko on 23.06.2022.
//

import UIKit
import Alamofire

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

class NetworkEmojiManager {
    
    static let shared = NetworkEmojiManager()
    
    private init() {}
    
    func fetchAF<T: Decodable>(dataType: T.Type, from url: String, completion: @escaping(Result<[Emoji], NetworkError>) -> Void) {
        
        AF.request(url)
            .validate()
            .responseJSON { dataResponse in
            switch dataResponse.result {
            case .success(let value):
                let result = Emoji.getEmojis(from: value)
                completion(.success(result))
            case .failure:
                completion(.failure(.decodingError))
            }
        }
    }
}
