//
//  NetworkManager.swift
//  FindYourEmoji
//
//  Created by Julia Romanenko on 23.06.2022.
//

import UIKit

class NetworkEmojiManager {
    
    static let shared = NetworkEmojiManager()
    
    private init() {}
    
    func fetchEmoji(_ url: String, _ onComplition: @escaping (([Emoji]) -> Void)) {
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let emojis = try JSONDecoder().decode([Emoji].self, from: data)
                onComplition(emojis)
            } catch let error {
                print("Data fetch error", error)
            }
        }.resume()
    }
}
