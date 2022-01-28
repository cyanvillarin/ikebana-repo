//
//  BirthdayViewController.swift
//  Ikebana
//
//  Created by CYAN on 2022/01/26.
//

import Foundation
import UIKit
import SAConfettiView

class BirthdayViewController: BaseViewController {
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      let confettiView = SAConfettiView(frame: self.view.bounds)
      self.view.addSubview(confettiView)
   }
   
}
