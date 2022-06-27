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
    
    func fetchAF<T: Decodable>(dataType: T.Type,
                             from url: String,
                             completion: @escaping(Result<[Emoji], NetworkError>) -> Void) {
        
        AF.request(url).validate().responseDecodable(of: [Emoji].self) { dataResponse in
            switch dataResponse.result {
            case .success(let value):
                completion(.success(value))
                var emojis: [Emoji] = []

                guard let emojisData = value as? [[String: Any]] else { return }

                for emojiData in emojisData {
                    let emoji = Emoji(
                        unicodeName: emojiData["unicodeName"] as? String,
                        group: emojiData["group"] as? String,
                        subGroup: emojiData["subGroup"] as? String,
                        codePoint: emojiData["codePoint"] as? String
                    )

                    emojis.append(emoji)
                }
                
            case .failure:
                completion(.failure(.decodingError))
            }
        }
    }
}
