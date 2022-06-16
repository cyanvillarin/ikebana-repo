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
        
    var imageToUse: String!
    
    @IBOutlet var bgImage: UIImageView!
    @IBOutlet var toLabel: UILabel!
    @IBOutlet var messageLabel: UILabel!
    @IBOutlet var loveYouLabel: UILabel!
    @IBOutlet var fromLabel: UILabel!
    
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
        
        if let image = imageToUse {
            bgImage.image = UIImage(named: image)
        } else {
            bgImage.image = UIImage(named: "message-bg-2")
        }
        
        toLabel.text = "美帆💓"
        messageLabel.text = "今まで色々ありがとう！これからも宜しくね 😌"
        loveYouLabel.text = "大好きだよ💜"
        fromLabel.text = "さやん✨"
    }
    
}
