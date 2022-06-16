//
//  AboutViewController.swift
//  Ikebana
//
//  Created by CYAN on 2022/01/28.
//

import Foundation
import UIKit

class AboutViewController: BaseViewController {
   
   @IBOutlet var logoImageView: UIImageView!
   
   override func viewDidLoad() {
      super.viewDidLoad()
      self.title = "About"
      
      logoImageView.layer.masksToBounds = true
      logoImageView.layer.cornerRadius = 10.0
   }
}
