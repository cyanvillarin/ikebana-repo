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
    
    var materials: [Material] = [
        Material(japaneseName: "Take 竹", englishName: "Bamboo", id: "take"),
        Material(japaneseName: "Sasa 笹", englishName: "Bamboo Grass", id: "sasa"),
        Material(japaneseName: "Tsuru Ume Modoki 鶴梅擬", englishName: "Bittersweet", id: "tsuruumemodoki"),
        Material(japaneseName: "Tsubaki 椿", englishName: "Camellia", id: "tsubaki"),
        Material(japaneseName: "Senryo 千両", englishName: "Ardisia", id: "senryo"),
        Material(japaneseName: "Kiku 菊", englishName: "Chrysamthemum", id: "kiku"),
        Material(japaneseName: "Shaga 著莪", englishName: "Iris", id: "shobu"),
        Material(japaneseName: "Mikan みかん", englishName: "Orang", id: "mikan"),
        Material(japaneseName: "Ume 梅", englishName: "Plum / Apricot", id: "ume"),
        Material(japaneseName: "Boke 木瓜", englishName: "Quince", id: "boke"),
        Material(japaneseName: "Nanten 南天", englishName: "Nandina / Nandida", id: "nanten"),
        Material(japaneseName: "Suisen 水仙", englishName: "Narcissus", id: "suisen"),
        Material(japaneseName: "Momo 桃", englishName: "Peach", id: "momo"),
        Material(japaneseName: "Matsu 松", englishName: "Pine Tree", id: "matsu"),
        Material(japaneseName: "Omoto 万年青", englishName: "Rohdea", id: "omoto"),
        Material(japaneseName: "Kanchiku 寒竹", englishName: "Non-hollow Bamboo", id: "kanchiku"),
        Material(japaneseName: "Botan 牡丹", englishName: "Tree Peony", id: "botan"),
        Material(japaneseName: "Shidare Yanagi 枝垂れ柳", englishName: "Weeping Willow", id: "shidareyanagi"),
        Material(japaneseName: "Ume Modoki 梅擬", englishName: "Winterberry", id: "umemodoki"),
        Material(japaneseName: "Roubai 蝋梅", englishName: "Wintersweet", id: "roubai")
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
    
    func updateFavorites() {
        for material in materials {
            if let materialId = material.id {
                let isFavorited = UserDefaults.standard.bool(forKey: "isFavorited_\(materialId)")
                if isFavorited {
                    material.isFavorited = true
                }
            }
        }
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
