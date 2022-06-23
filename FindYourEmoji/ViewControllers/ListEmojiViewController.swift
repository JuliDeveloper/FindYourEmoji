//
//  ListEmojiViewController.swift
//  FindYourEmoji
//
//  Created by Julia Romanenko on 22.06.2022.
//

import UIKit

class ListEmojiViewController: UITableViewController {

    var emojis: [Emoji] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 80
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let emoji = emojis[indexPath.row]
        
        guard let detailsVC = segue.destination as? DetailsEmojiViewController else { return }
        detailsVC.emoji = emoji
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        emojis.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmojiCell", for: indexPath) as! EmojiCell
        let emoji = emojis[indexPath.row]
        
        cell.configure(with: emoji)
        cell.selectionStyle = .none
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ShowDetails", sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
