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
        Style(name: "Rikka 立花", imageName: "rikka"),
        Style(name: "Seika 活花", imageName: "seika"),
        Style(name: "Moribana 盛花", imageName: "moribana"),
        Style(name: "Modern Ikebana 現代生花", imageName: "contemporary-ikebana")
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
