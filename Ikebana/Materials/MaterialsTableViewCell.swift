//
//  MaterialsTableViewCell.swift
//  Ikebana
//
//  Created by CYAN on 2022/01/26.
//

import UIKit
import Kingfisher
import SwiftUI

protocol MaterialsTableViewCellDelegate: AnyObject {
    func didTapFavoriteButton()
}

class MaterialsTableViewCell: UITableViewCell {
    
    var material: Material!
    
    weak var delegate: MaterialsTableViewCellDelegate?
    
    @IBOutlet var favoriteButton: UIButton!
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
        self.material = material
        if let imageName = material.imageName {
            if let image = UIImage(named: imageName) {
                materialImageView.image = image
            }
        }
        japaneseNameLabel.text = material.japaneseName
        englishNameLabel.text = material.englishName
        favoriteButton.setTitle("", for: .normal)
        
        if material.isFavorited {
            favoriteButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        } else {
            favoriteButton.setImage(UIImage(systemName: "heart"), for: .normal)
        }
    }
    
    @IBAction func didTapFavoriteButton() {
        
        if self.material.isFavorited {
            
            // set it to not favorited in appearance
            favoriteButton.setImage(UIImage(systemName: "heart"), for: .normal)
            
            // set it to not favorited in UserDefaults as well
            // set it to not favorited in self.material
            
        } else {
            
            // set it to favorited in appearance
            favoriteButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            
            // set it to favorited in UserDefaults as well
            // set it to favorited in self.material
            
        }
        
        self.delegate?.didTapFavoriteButton()
    }
    
}
