//
//  RandonEmojiViewController.swift
//  FindYourEmoji
//
//  Created by Julia Romanenko on 23.06.2022.
//

import UIKit

class RandonEmojiViewController: UIViewController {
    
    @IBOutlet weak var lablesStackView: UIStackView!
    @IBOutlet weak var emojiLable: UILabel!
    @IBOutlet weak var questionLable: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var startButton: UIButton!
    
    var emoji: Emoji!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lablesStackView.isHidden = true
        activityIndicator.isHidden = true
    }

    @IBAction func setEmoji() {
        questionLable.isHidden = true
        lablesStackView.isHidden = false
        emojiLable.isHidden = true
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
            self.emojiLable.text = String(self.getUnicode(from: self.emoji))
            self.emojiLable.isHidden = false
            self.activityIndicator.stopAnimating()
            self.activityIndicator.isHidden = true
        })
        
        startButton.isHidden = true
    }
}

extension RandonEmojiViewController {
    func getUnicode(from emoji: Emoji) -> UnicodeScalar {
        guard let unicode = emoji.codePoint else { return "\u{1F600}" }
        guard let codeint = UInt32(unicode, radix: 16) else { return "\u{1F600}" }
        guard let c = UnicodeScalar(codeint) else { return "\u{1F600}" }
        return c
    }
}
