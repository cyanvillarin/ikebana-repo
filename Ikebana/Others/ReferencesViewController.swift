//
//  ReferencesViewController.swift
//  Ikebana
//
//  Created by CYAN on 2022/01/28.
//

import Foundation
import UIKit

class ReferencesViewController: BaseViewController {
    
    @IBOutlet var tableView: UITableView!
    
    let itemNames = [
        "https://learnjapanese123.com/art-ikebana-origins-styles/",
        "https://japanobjects.com/features/ikebana",
        "https://orchidrepublic.com/blogs/news/what-is-ikebana-facts-on-the-japanese-art-of-flower-arrangement"
    ]
    
    var pattern: String = ""
    
    var possibleImagesToUse = [
        "message-bg-1",
        "message-bg-2",
        "message-bg-3",
        "message-bg-4",
        "message-bg-5",
        "message-bg-6",
        "message-bg-7",
        "message-bg-8",
        "message-bg-9",
        "message-bg-10"
    ]
    var indexOfImageToUse = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.tabBarController?.title = "References"
        
        // reset the stuff
        self.indexOfImageToUse = 0
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "ReferencesTableViewCell", bundle: nil), forCellReuseIdentifier: "ReferencesTableViewCell")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // reset on return from the message view
        self.pattern = ""
    }
}

extension ReferencesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            pattern = pattern + "0"
        case 1:
            pattern = pattern + "1"
        case 2:
            pattern = pattern + "2"
        default:()
        }
        
        if pattern == "01111222" {
            if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BirthdayViewController") as? MessageViewController,
               let navigator = navigationController {
                
                vc.imageToUse = self.possibleImagesToUse[self.indexOfImageToUse]
                
                // update the index for the next time to show the image
                // keep adding 1 to index to switch to next image
                if self.indexOfImageToUse != 9 {
                    self.indexOfImageToUse = self.indexOfImageToUse + 1
                } else {
                    // if it becomes 9 (the end of the possible images), reset to 0
                    self.indexOfImageToUse = 0
                }
                
                navigator.pushViewController(vc, animated: true)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
}

extension ReferencesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReferencesTableViewCell", for: indexPath) as! ReferencesTableViewCell
        DispatchQueue.main.async {
            cell.setup(itemName: self.itemNames[indexPath.row])
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemNames.count
    }
    
}
