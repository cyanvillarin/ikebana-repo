//
//  StylesDetailViewController.swift
//  Ikebana
//
//  Created by CyanCamit.Villari on 2022/06/24.
//

import Foundation
import UIKit

class StylesDetailViewController: UIViewController {
    
    var style: Style!
    @IBOutlet var styleNameLabel: UILabel!
    @IBOutlet var styleImage: UIImageView!
    @IBOutlet var styleDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        styleNameLabel.text = style.name
        if let imageName = style.imageName {
            styleImage.image = UIImage(named: imageName)
        }
        styleDescription.text = style.description
    }
    
}
