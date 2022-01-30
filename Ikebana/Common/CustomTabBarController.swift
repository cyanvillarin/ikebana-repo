//
//  CustomTabBarController.swift
//  Ikebana
//
//  Created by CYAN on 2022/01/26.
//

import Foundation
import UIKit

class CustomTabBarController: UITabBarController {
   
   override func viewDidLoad() {
      super.viewDidLoad()
      /// Fix for iOS 15 issue
      if #available(iOS 15.0, *) {
         let appearance = UITabBarAppearance()
         appearance.configureWithOpaqueBackground()
         appearance.backgroundColor = .clear
         tabBar.standardAppearance = appearance
         tabBar.scrollEdgeAppearance = appearance
      } else {
         tabBar.backgroundColor = .clear
      }
      tabBar.tintColor = .purple
   }
   
}
