//
//  Extension + ViewController.swift
//  FindYourEmoji
//
//  Created by Julia Romanenko on 27.06.2022.
//

import UIKit

extension UIViewController {
    func getUnicode(from emoji: Emoji) -> UnicodeScalar {
        guard let unicode = emoji.codePoint else { return "\u{1F600}" }
        guard let codeint = UInt32(unicode, radix: 16) else { return "\u{1F600}" }
        guard let c = UnicodeScalar(codeint) else { return "\u{1F600}" }
        return c
    }
}
