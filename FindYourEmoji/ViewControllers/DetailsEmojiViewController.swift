//
//  DetailsEmojiViewController.swift
//  FindYourEmoji
//
//  Created by Julia Romanenko on 22.06.2022.
//

import UIKit

class DetailsEmojiViewController: UIViewController {

    @IBOutlet weak var emojiLable: UILabel!
    @IBOutlet weak var nameEmojiLable: UILabel!
    @IBOutlet weak var categoryLable: UILabel!
    @IBOutlet weak var groupLable: UILabel!
    
    var emoji: Emoji!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.async {
            self.emojiLable.text = String(self.getUnicode(from: self.emoji))
            self.nameEmojiLable.text = self.emoji.unicodeName
            self.categoryLable.text = "Category: \(self.emoji.group ?? "")"
            self.groupLable.text = "Group: \(self.emoji.subGroup ?? "")"
        }
    }
}
