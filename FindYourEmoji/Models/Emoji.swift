//
//  Emoji.swift
//  FindYourEmoji
//
//  Created by Julia Romanenko on 22.06.2022.
//

import Foundation

struct Emoji: Decodable {
    let unicodeName: String?
    let group: String?
    let subGroup: String?
    let codePoint: String?
}
