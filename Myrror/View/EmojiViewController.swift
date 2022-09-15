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
    var emojiName : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAnimation()
    }
    
    internal func setupAnimation() {
        animationView.animation = Animation.named(emojiName)
        animationView.frame = view.bounds
        animationView.backgroundColor = .clear
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.play()
        view.addSubview(animationView)
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        animationView.backgroundColor = .systemGray
        animationView.play(toFrame: 75)
    }
}

