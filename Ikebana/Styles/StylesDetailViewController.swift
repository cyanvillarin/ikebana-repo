//
//  StylesDetailViewController.swift
//  Ikebana
//
//  Created by CyanCamit.Villari on 2022/06/24.
//

import Foundation
import UIKit

class StylesDetailViewController: UIViewController {
    
    @IBOutlet weak var contentViewHeightConstraint: NSLayoutConstraint!
    var style: Style!
    @IBOutlet var styleNameLabel: UILabel!
    @IBOutlet var styleImage: UIImageView!
    @IBOutlet var styleDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch style.id {
        case "rikka":
            contentViewHeightConstraint.constant = UIScreen.main.bounds.height + 100.0
        case "seika":
            contentViewHeightConstraint.constant = UIScreen.main.bounds.height + 300.0
        case "moribana":
            contentViewHeightConstraint.constant = UIScreen.main.bounds.height
        case "contemporary-ikebana":
            contentViewHeightConstraint.constant = UIScreen.main.bounds.height
        default:()
        }
        
        styleNameLabel.text = style.name
        if let imageName = style.imageName {
            styleImage.image = UIImage(named: imageName)
        }
        styleDescription.text = style.description
    }
    
}
