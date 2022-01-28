//
//  ReferencesTableViewCell.swift
//  Ikebana
//
//  Created by CYAN on 2022/01/28.
//

import UIKit

class ReferencesTableViewCell: UITableViewCell {
   
   @IBOutlet var itemLabel: UILabel!
   
   override func awakeFromNib() {
      super.awakeFromNib()
   }
   
   override func setSelected(_ selected: Bool, animated: Bool) {
      super.setSelected(selected, animated: animated)
   }
   
   func setup(itemName: String) {
      itemLabel.text = itemName
   }
   
}
