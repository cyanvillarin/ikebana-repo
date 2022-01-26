//
//  StylesViewController.swift
//  Ikebana
//
//  Created by CYAN on 2022/01/25.
//

import UIKit
import CircularCarousel

class StylesViewController: BaseViewController {
   
   let itemWidth: CGFloat = 100.0
   
   let styles: [Style] = [
      Style(name: "Rikka 立花", imageName: "rikka"),
      Style(name: "Seika 製菓", imageName: "seika"),
      Style(name: "Moribana 盛花", imageName: "moribana"),
      Style(name: "Contemporary Ikebana 現代生花", imageName: "contemporary-ikebana")
   ]
   
   private weak var _carousel : CircularCarousel!
   @IBOutlet var carousel : CircularCarousel! {
      set {
         _carousel = newValue
         _carousel.delegate = self
         _carousel.dataSource = self
      }
      get {
         return _carousel
      }
   }
   
   override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view.
   }
   
}

extension StylesViewController: CircularCarouselDataSource {
   func numberOfItems(inCarousel carousel: CircularCarousel) -> Int {
      return styles.count
   }
   
   func carousel(_: CircularCarousel, viewForItemAt indexPath: IndexPath, reuseView view: UIView?) -> UIView {
      var view = view
      
      if view == nil {
         view = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
         
         let imageView = UIImageView()
         imageView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
         if let imageName = styles[indexPath.row].imageName {
            if let image = UIImage(named: imageName) {
               imageView.image = image
            }
         }
         view?.addSubview(imageView)
      }
      
      return view!
   }
   
   func startingItemIndex(inCarousel carousel: CircularCarousel) -> Int {
      return 0
   }
}

extension StylesViewController: CircularCarouselDelegate {
   func carousel<CGFloat>(_ carousel: CircularCarousel, valueForOption option: CircularCarouselOption, withDefaultValue defaultValue: CGFloat) -> CGFloat {
      switch option {
      case .itemWidth:
         return itemWidth as! CGFloat
         /*  Insert one of the following handlers :
          case spacing
          case fadeMin
          case fadeMax
          case fadeRange
          case fadeMinAlpha
          case offsetMultiplier
          case itemWidth
          case scaleMultiplier
          case minScale
          case maxScale
          */
      default:
         return defaultValue
      }
   }
   func carousel(_ carousel: CircularCarousel, didSelectItemAtIndex index: Int) {
      /* Handle selection of the selected carousel item */
   }
   func carousel(_ carousel: CircularCarousel, willBeginScrollingToIndex index: Int) {
      
   }
   func carousel(_ carousel: CircularCarousel, spacingForOffset offset: CGFloat) -> CGFloat {
      return 10.0
   }
}