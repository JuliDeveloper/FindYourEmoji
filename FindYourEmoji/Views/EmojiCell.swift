//
//  EmojiCell.swift
//  FindYourEmoji
//
//  Created by Julia Romanenko on 22.06.2022.
//

import UIKit

class EmojiCell: UITableViewCell {
    @IBOutlet weak var emojiLable: UILabel!
    @IBOutlet weak var nameLable: UILabel!
    
    func configure(with emoji: Emoji) {
        DispatchQueue.main.async {
            self.emojiLable.text = String(self.getUnicode(from: emoji))
            self.nameLable.text = emoji.unicodeName
        }
    }
}

extension EmojiCell {
    func getUnicode(from emoji: Emoji) -> UnicodeScalar {
        guard let unicode = emoji.codePoint else { return "\u{1F600}" }
        guard let codeint = UInt32(unicode, radix: 16) else { return "\u{1F600}" }
        guard let c = UnicodeScalar(codeint) else { return "\u{1F600}" }
        return c
    }
}
