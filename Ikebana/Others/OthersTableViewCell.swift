//
//  OthersTableViewCell.swift
//  Ikebana
//
//  Created by CYAN on 2022/01/28.
//

import UIKit

class OthersTableViewCell: UITableViewCell {
   
   @IBOutlet var itemImageView: UIImageView!
   @IBOutlet var itemLabel: UILabel!
   
   override func awakeFromNib() {
      super.awakeFromNib()
   }
   
   override func setSelected(_ selected: Bool, animated: Bool) {
      super.setSelected(selected, animated: animated)
   }
   
   override func prepareForReuse() {
      super.prepareForReuse()
      itemImageView.image = nil
   }
   
   func setup(itemName: String) {
//      if let image = UIImage(named: imageName) {
//         itemImageView.image = image
//      }
      itemLabel.text = itemName
   }
   
}
