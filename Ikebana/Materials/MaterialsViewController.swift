//
//  MaterialsViewController.swift
//  Ikebana
//
//  Created by CYAN on 2022/01/26.
//

import Foundation
import UIKit
import SwiftUI

class MaterialsViewController: BaseViewController {
    
    let adUnitId = "ca-app-pub-8855918227783661/1322009664"
    
    @IBOutlet var tableView: UITableView!
    
    let cellHeight: CGFloat = 87.0
    
    let materials: [Material] = [
        Material(japaneseName: "Take 竹", englishName: "Bamboo", imageName: "take"),
        Material(japaneseName: "Sasa 笹", englishName: "Bamboo Grass", imageName: "sasa"),
        Material(japaneseName: "Tsuru Ume Modoki 鶴梅擬", englishName: "Bittersweet", imageName: "tsuruumemodoki"),
        Material(japaneseName: "Tsubaki 椿", englishName: "Camellia", imageName: "tsubaki"),
        Material(japaneseName: "Senryo 千両", englishName: "Ardisia", imageName: "senryo"),
        Material(japaneseName: "Kiku 菊", englishName: "Chrysamthemum", imageName: "kiku"),
        Material(japaneseName: "Shaga 著莪", englishName: "Iris", imageName: "shobu"),
        Material(japaneseName: "Mikan みかん", englishName: "Orang", imageName: "mikan"),
        Material(japaneseName: "Ume 梅", englishName: "Plum / Apricot", imageName: "ume"),
        Material(japaneseName: "Boke 木瓜", englishName: "Quince", imageName: "boke"),
        Material(japaneseName: "Nanten 南天", englishName: "Nandina / Nandida", imageName: "nanten"),
        Material(japaneseName: "Suisen 水仙", englishName: "Narcissus", imageName: "suisen"),
        Material(japaneseName: "Momo 桃", englishName: "Peach", imageName: "momo"),
        Material(japaneseName: "Matsu 松", englishName: "Pine Tree", imageName: "matsu"),
        Material(japaneseName: "Omoto 万年青", englishName: "Rohdea", imageName: "omoto"),
        Material(japaneseName: "Kanchiku 寒竹", englishName: "Non-hollow Bamboo", imageName: "kanchiku"),
        Material(japaneseName: "Botan 牡丹", englishName: "Tree Peony", imageName: "botan"),
        Material(japaneseName: "Shidare Yanagi 枝垂れ柳", englishName: "Weeping Willow", imageName: "shidareyanagi"),
        Material(japaneseName: "Ume Modoki 梅擬", englishName: "Winterberry", imageName: "umemodoki"),
        Material(japaneseName: "Roubai 蝋梅", englishName: "Wintersweet", imageName: "roubai")
    ]
    
    let imageNames = [""]
    let japaneseNames = [""]
    let englishNames = [""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "MaterialsTableViewCell", bundle: nil), forCellReuseIdentifier: "MaterialsTableViewCell")
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
}

extension MaterialsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MaterialsDetailViewController") as? MaterialsDetailViewController,
           let navigator = navigationController {
            self.navigationController?.navigationBar.prefersLargeTitles = false
            vc.material = materials[indexPath.row]
            navigator.pushViewController(vc, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
}

extension MaterialsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MaterialsTableViewCell", for: indexPath) as! MaterialsTableViewCell
        DispatchQueue.main.async {
            cell.setup(material: self.materials[indexPath.row])
            cell.selectionStyle = .none
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
}
