//
//  CustomViewController.swift
//  Ikebana
//
//  Created by CYAN on 2022/01/26.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
   
   override var preferredStatusBarStyle: UIStatusBarStyle {
      return .lightContent
   }
   
   override func viewWillAppear(_ animated: Bool) {
      
      /// Fix Nav Bar tint issue in iOS 15.0 or later - is transparent w/o code below
      if #available(iOS 15, *) {
         let appearance = UINavigationBarAppearance()
         appearance.configureWithOpaqueBackground()
         appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
         appearance.backgroundColor = .clear
         navigationController?.navigationBar.standardAppearance = appearance
         navigationController?.navigationBar.scrollEdgeAppearance = appearance
         
      } else {
         navigationController?.navigationBar.barTintColor = .clear
      }
      
   }
}
