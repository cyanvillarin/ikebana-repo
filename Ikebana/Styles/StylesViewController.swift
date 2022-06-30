//
//  StylesViewController.swift
//  Ikebana
//
//  Created by CYAN on 2022/01/25.
//

import UIKit
import CircularCarousel
import AppTrackingTransparency
import AdSupport

class StylesViewController: BaseViewController {
   
   let itemWidth: CGFloat = 100.0
   
   let styles: [Style] = [
      Style(id: "rikka", name: "Rikka 立花", imageName: "rikka", description: "The early Buddhist floral decorations were intended to symbolize the idealized beauty of paradise, and as a result they were generally both ornate and sumptuous. The same attributes were preserved in Rikka – the first Ikebana style – which aimed not so much at revealing the beauty of flowers as at using flowers to embody an elevated concept of the cosmos.\nRikka’s structural rules – called positions – guide the basic composition of the style. The nine key positions were developed by the Buddhist monks, who incorporated Buddhist teachings into their flower arrangements.\nIkebana is a visual art that uses plant materials that come in a wide variety of forms. Depending on the materials, artistic judgment must be used to readjust the established forms. In the Rikka style, it is essential that the nine positions be honored; but doing so, with the understand that within this structure there is room for personal expression, is the secret to Rikka. "),
      Style(id: "seika", name: "Seika 活花", imageName: "seika", description: "In contrast to the formality of Rikka’s strict Ikebana rules, other freer ways of arranging flowers were known as Nageire simply meaning thrown in. The distinctive feature of the Nageire arrangement was that the flowers were not made to stand erect by artificial means, but were allowed to rest in the vase naturally.\nIt is by no means accidental that the Rikka style is associated with the more traditional forms of Buddhism, while the Nageire style is associated with Zen, for Rikka arrangements grew from a philosophic attempt to conceive an organized universe, while Nageire arrangements represent an attempt to achieve immediate oneness with the universe.\nBy the end of the eighteenth century the interplay between Rikka and Nageire gave rise to a new type of flower arrangement called Seika, which literally means fresh-living flowers.\nIn the Seika style, three of the original positions were retained: shin, soe, and uke (although now known as taisaki), creating an uneven triangle.\nIn a Seika arrangement, which is placed in the tokonoma alcove, the active empty space both within the arrangement and within the frame of the tokonoma are vitally important.\nHistorically, Seika arrangements were composed of one material – the exception being the more sumptuous arrangements created for the New Year’s celebrations. Today the rule has been relaxed, and arrangements made of one, two or three materials are common."),
      Style(id: "moribana", name: "Moribana 盛花", imageName: "moribana", description: "Until recent years, the tokonoma alcove, where Ikebana was traditionally displayed, was considered a sacred space, but it is no longer included in modern, Western-based Japanese architecture. Today’s open spaces require that Ikebana be viewed from all sides, from 360 degrees. This is totally different from the approach to Ikebana in the past. To be appreciated, Seika must be in a tokonoma and be viewed while sitting on the floor in front of the arrangement. The Moribana (piling up) category of Ikebana evolved as a way to create a more three-dimensional sculptural quality with the use of natural plants. "),
      Style(id: "contemporary-ikebana", name: "Modern Ikebana 現代生花", imageName: "contemporary-ikebana", description: "The concept and style of classic flower arrangements – such as Rikka and Seika – continue to be fundamental, but modern tastes have led to the use of a variety of materials not previously used in Ikebana. In this example, perhaps the unique flower vase with its three thin, painted lines inspired the artist to create this stunning arrangement. If plant materials were not used, this arrangement could be considered a contemporary sculpture. ")
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
   
   @IBOutlet var backgroundImage: UIImageView!
   @IBOutlet var styleNameLabel: UILabel!
   
   override func viewDidLoad() {
      super.viewDidLoad()
      backgroundImage.applyBlurEffect()
      carousel.backgroundColor = .clear
      
      DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
         if #available(iOS 14, *) {
            ATTrackingManager.requestTrackingAuthorization(completionHandler: { status in
               // Tracking authorization completed. Start loading ads here.
            })
         }
      }
   }
   
   override var preferredStatusBarStyle: UIStatusBarStyle {
      return .default
   }
}

extension StylesViewController: CircularCarouselDataSource {
    func numberOfItems(inCarousel carousel: CircularCarousel) -> Int {
        return styles.count
    }
    
    func carousel(_: CircularCarousel, viewForItemAt indexPath: IndexPath, reuseView view: UIView?) -> UIView {
        var view = view
        
        if view == nil {
            view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 300))
            view?.backgroundColor = .clear
            let imageView = UIImageView()
            imageView.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 300)
            if let imageName = styles[indexPath.row].imageName {
                if let image = UIImage(named: imageName) {
                    imageView.image = image
                    imageView.clipsToBounds = true
                    imageView.contentMode = .scaleAspectFit
                    imageView.backgroundColor = .clear
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
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "StylesDetailViewController") as? StylesDetailViewController {
            self.present(vc, animated: true)
        }
    }
    
    func carousel(_ carousel: CircularCarousel, willBeginScrollingToIndex index: Int) {
        if let imageName = styles[index].imageName {
            if let image = UIImage(named: imageName) {
                backgroundImage.image = image
                backgroundImage.contentMode = .scaleAspectFill
            }
        }
        if let styleLabel = styleNameLabel {
            styleLabel.text = styles[index].name
            styleLabel.alpha = 0.6
        }
    }
    func carousel(_ carousel: CircularCarousel, spacingForOffset offset: CGFloat) -> CGFloat {
        return 10.0
    }
}
