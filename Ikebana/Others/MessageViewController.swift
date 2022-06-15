//
//  BirthdayViewController.swift
//  Ikebana
//
//  Created by CYAN on 2022/01/26.
//

import Foundation
import UIKit
import ConfettiView
class MessageViewController: BaseViewController {
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      let confettiView = ConfettiView()
      self.view.addSubview(confettiView)
      confettiView.emit(with: [
        .text("❤️"),
        .text("🌸"),
        .shape(.circle, .purple),
        .shape(.triangle, .cyan)
      ]) { _ in
        // Optional completion handler fires when animation finishes.
      }
      
   }
   
}
