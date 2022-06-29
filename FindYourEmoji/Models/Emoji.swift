//
//  Emoji.swift
//  FindYourEmoji
//
//  Created by Julia Romanenko on 22.06.2022.
//

import Foundation

enum Link: String {
    case urlEmojis = "https://emoji-api.com/emojis?access_key="
}

struct Emoji: Decodable {
    let unicodeName: String?
    let group: String?
    let subGroup: String?
    let codePoint: String?
    
    init(emojiData: [String: Any]) {
        unicodeName = emojiData["unicodeName"] as? String
        group = emojiData["group"] as? String
        subGroup = emojiData["subGroup"] as? String
        codePoint = emojiData["codePoint"] as? String
    }
    
    static func getEmojis(from value: Any) -> [Emoji] {
        guard let emojisData = value as? [[String: Any]] else { return [] }
        return emojisData.compactMap { Emoji(emojiData: $0) }
    }
}
