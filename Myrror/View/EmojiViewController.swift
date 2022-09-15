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
        setupAnimation()
    }
    
    private func setupAnimation() {
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
