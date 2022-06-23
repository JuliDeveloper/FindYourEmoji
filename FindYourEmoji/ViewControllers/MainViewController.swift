//
//  ViewController.swift
//  FindYourEmoji
//
//  Created by Julia Romanenko on 22.06.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    private let url = "https://emoji-api.com/emojis?access_key=\(apiKey)"
    
    var emojis: [Emoji] = []
    var emoji: Emoji!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkEmojiManager.shared.fetchEmoji(url) { emojis in
            self.emojis = emojis
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarController = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tabBarController.viewControllers else { return }
        
        for viewController in viewControllers {
            if let navVC = viewController as? UINavigationController {
                if let listVC = navVC.topViewController as? ListEmojiViewController {
                    listVC.emojis = self.emojis
                    DispatchQueue.main.async {
                        listVC.tableView.reloadData()
                    }
                }
            } else if let randomVC = viewController as? RandonEmojiViewController {
                randomVC.emoji = emojis.randomElement()
            }
        }
    }
}

extension MainViewController {
    func getUnicode(from emoji: Emoji) -> UnicodeScalar {
        guard let unicode = emoji.codePoint else { return "\u{1F600}" }
        guard let codeint = UInt32(unicode, radix: 16) else { return "\u{1F600}" }
        guard let c = UnicodeScalar(codeint) else { return "\u{1F600}" }
        return c
    }
}
