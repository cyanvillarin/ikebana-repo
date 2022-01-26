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
   
   @IBOutlet var tableView: UITableView!
   
   let cellHeight: CGFloat = 87.0
   
   let materials: [Material] = [
      Material(japaneseName: "Take 竹", englishName: "Bamboo", imageName: "take"),
      Material(japaneseName: "Sasa 笹", englishName: "Bamboo Grass", imageName: "sasa"),
      Material(japaneseName: "Tsurume Ume Modoki 鶴梅擬", englishName: "Bittersweet", imageName: "tsuruumemodoki"),
      Material(japaneseName: "Tsubaki 椿", englishName: "Camellia", imageName: "tsubaki"),
      Material(japaneseName: "Senryo 占領", englishName: "Chloranthemum", imageName: "senryo"),
      Material(japaneseName: "Kiku 菊", englishName: "Chrysamthemum", imageName: "kiku"),
      Material(japaneseName: "Shobu 諸部", englishName: "Iris", imageName: "shobu"),
      Material(japaneseName: "Mikan みかん", englishName: "Orang", imageName: "mikan"),
      Material(japaneseName: "Ume 梅", englishName: "Plum / Apricot", imageName: "ume"),
      Material(japaneseName: "Boke 惚", englishName: "Quince", imageName: "boke"),
      Material(japaneseName: "Nanten 難点", englishName: "Nandina / Nandida", imageName: "nanten"),
      Material(japaneseName: "Suisen 推薦", englishName: "Narcissus", imageName: "suisen"),
      Material(japaneseName: "Momo もも", englishName: "Peach", imageName: "momo"),
      Material(japaneseName: "Matsu 松", englishName: "Pine Tree", imageName: "matsu"),
      Material(japaneseName: "Omoto 竹", englishName: "Rohdea", imageName: "omoto"),
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
      
   }
   
   
}

extension MaterialsViewController: UITableViewDelegate {
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      print(indexPath.row)
   }
   
   func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      return cellHeight
   }
}

extension MaterialsViewController: UITableViewDataSource {
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "MaterialsTableViewCell", for: indexPath) as! MaterialsTableViewCell
      cell.setup(material: materials[indexPath.row])
      return cell
   }
   
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return 20
   }
   
}
