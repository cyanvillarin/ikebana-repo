//
//  MaterialsDetailViewController.swift
//  Ikebana
//
//  Created by CyanCamit.Villari on 2022/06/24.
//

import Foundation
import UIKit

class MaterialsDetailViewController: UIViewController {
    
    var material: Material!
    
    @IBOutlet var materialImageView: UIImageView!
    @IBOutlet var materialJapaneseName: UILabel!
    @IBOutlet var materialEnglishName: UILabel!
    @IBOutlet var favoriteButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Details"
        
        materialJapaneseName.text = material.japaneseName
        
        if let imageName = material.imageName {
            materialImageView.image = UIImage(named: imageName)
        }
        
        materialEnglishName.text = material.englishName
        
        setupFavoritesButton()
        
    }
    
    func setupFavoritesButton() {
        if material.isFavorited {
            favoriteButton.setTitle("Remove from Favorites", for: .normal)
            favoriteButton.backgroundColor = UIColor(hexString: "FF564B")
        } else {
            favoriteButton.setTitle("Add to Favorites", for: .normal)
            favoriteButton.backgroundColor = UIColor(hexString: "AF7FE6")
        }
    }
    
    @IBAction func didTapFavoriteButton() {
        if material.isFavorited {
            // set it to unfavorited
            material.isFavorited = false
        } else {
            // set it to favorited
            material.isFavorited = true
        }
        
        if let id = material.id {
            UserDefaults.standard.set(material.isFavorited, forKey: "isFavorited_\(id)")
        }
        setupFavoritesButton()
    }
    
}
