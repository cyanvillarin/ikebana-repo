//
//  MaterialsTableViewCell.swift
//  Ikebana
//
//  Created by CYAN on 2022/01/26.
//

import UIKit
import Kingfisher
import SwiftUI

class MaterialsTableViewCell: UITableViewCell {
   
   @IBOutlet var materialImageView: UIImageView!
   @IBOutlet var japaneseNameLabel: UILabel!
   @IBOutlet var englishNameLabel: UILabel!
   
   override func awakeFromNib() {
      super.awakeFromNib()
      self.layoutIfNeeded()
      materialImageView.layer.masksToBounds = true
      materialImageView.layer.cornerRadius = 5.0
   }
   
   override func setSelected(_ selected: Bool, animated: Bool) {
      super.setSelected(selected, animated: animated)
   }
   
   override func prepareForReuse() {
      super.prepareForReuse()
      materialImageView.image = nil
   }
   
   func setup(material: Material) {
      if let imageName = material.imageName {
         if let image = UIImage(named: imageName) {
            materialImageView.image = image
         }
      }
      japaneseNameLabel.text = material.japaneseName
      englishNameLabel.text = material.englishName
   }
   
}
