//
//  ViewController.swift
//  FindYourEmoji
//
//  Created by Julia Romanenko on 22.06.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    var emojis: [Emoji] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchEmoji()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarController = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tabBarController.viewControllers else { return }
        
        for viewController in viewControllers {
            if let randomVC = viewController as? RandonEmojiViewController {
                randomVC.emoji = emojis.randomElement()
            }
        }
    }
}

extension MainViewController {
    private func fetchEmoji() {
        NetworkEmojiManager.shared.fetchAF(dataType: [Emoji].self, from: Link.urlEmojis.rawValue + apiKey) { result in
            switch result {
            case .success(let emojis):
                self.emojis = emojis
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
