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
   
   override func viewDidLoad() {
      super.viewDidLoad()
      pattern = ""
      self.title = "References"
      tableView.delegate = self
      tableView.dataSource = self
      tableView.separatorStyle = .none
      tableView.register(UINib(nibName: "ReferencesTableViewCell", bundle: nil), forCellReuseIdentifier: "ReferencesTableViewCell")
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
         if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BirthdayViewController") as? BirthdayViewController,
            let navigator = navigationController {
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
