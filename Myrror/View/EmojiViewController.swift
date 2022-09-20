//
//  EmojiViewController.swift
//  Myrror
//
//  Created by Christian Paulo on 14/09/22.
//

import UIKit
import Lottie
class EmojiViewController: UIViewController {

    let animationView = AnimationView()
    var emojiName : String = "sad2"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //setupAnimation()
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(EmojiViewController.handleTap))
        tapRecognizer.numberOfTapsRequired = 1
        tapRecognizer.numberOfTouchesRequired = 1
        quadrado.addGestureRecognizer(tapRecognizer)
        quadrado.isUserInteractionEnabled = true
        
        view.addSubview(quadrado)
        
        
    }
    
    let quadrado : UIView = {
        let quadrado = UIView(frame: CGRect(x: 100, y: 100, width: 30, height: 30))
        quadrado.backgroundColor = .systemRed
        
        return quadrado
    }()
    
    @objc func handleTap(sender: UITapGestureRecognizer) {
        print("TA AQUIII!!!")
//        if sender.state == .ended {
//            print("UIImageView tapped")
//        }
//        if sender.state == .began {
//            print("TA AQUIIIII!!!")
//        }
    }
    
    internal func setupAnimation() {
        animationView.animation = Animation.named(emojiName)
        animationView.frame = view.bounds
        animationView.backgroundColor = .clear
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.play()
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        animationView.backgroundColor = .systemGray
        animationView.play(toFrame: 75)
    }
}

