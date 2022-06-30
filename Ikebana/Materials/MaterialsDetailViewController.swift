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
        
    }
    
    @IBAction func didTapFavoriteButton() {
        print("Im tapped")
    }
    
}
