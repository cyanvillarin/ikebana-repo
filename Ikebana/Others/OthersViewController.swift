//
//  OthersViewController.swift
//  Ikebana
//
//  Created by CYAN on 2022/01/26.
//

import Foundation
import UIKit

class OthersViewController: BaseViewController {
    
    @IBOutlet var tableView: UITableView!
    
    let itemNames = ["About", "References"]
    let cellHeight: CGFloat = 63.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "OthersTableViewCell", bundle: nil), forCellReuseIdentifier: "OthersTableViewCell")
    }
    
}

extension OthersViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AboutViewController") as? AboutViewController,
               let navigator = navigationController {
                navigator.pushViewController(vc, animated: true)
            }
        case 1:
            if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ReferencesViewController") as? ReferencesViewController,
               let navigator = navigationController {
                self.navigationController?.navigationBar.prefersLargeTitles = true
                
                navigator.pushViewController(vc, animated: true)
            }
        default:()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
}

extension OthersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OthersTableViewCell", for: indexPath) as! OthersTableViewCell
        DispatchQueue.main.async {
            cell.setup(itemName: self.itemNames[indexPath.row])
            cell.selectionStyle = .none
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemNames.count
    }
    
}

