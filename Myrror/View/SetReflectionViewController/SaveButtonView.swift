//
//  SaveButtonView.swift
//  Myrror
//
//  Created by Beatriz Leonel da Silva on 28/09/22.
//

import UIKit
import Lottie

class SaveButtonView: UIView {

     let animationView : AnimationView = {
         let animationView = AnimationView()
         animationView.animation = Animation.named("sucess")
         animationView.contentMode = .scaleAspectFit
         animationView.loopMode = .repeat(1)
         animationView.translatesAutoresizingMaskIntoConstraints = false
         return animationView
     }()

     let textView : UILabel = {
         let title = UILabel()
         title.text = "Finalizar"
         title.font = UIFont.preferredFont(forTextStyle: .body)
         title.translatesAutoresizingMaskIntoConstraints = false
         return title
     }()

     override init(frame: CGRect) {
         super.init(frame: frame)
         self.backgroundColor = UIColor(named: "AccentColor")
         self.addSubview(textView)
         self.addSubview(animationView)
         setConstraints()
     }

     required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }

     func setConstraints() {
         let textViewConstraints = [
             textView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
             textView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
         ]
         let animationViewConstraints = [
             animationView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
             animationView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
             animationView.heightAnchor.constraint(equalTo: self.heightAnchor, constant: -6),
             animationView.widthAnchor.constraint(equalTo: self.heightAnchor, constant: -6)
         ]
         NSLayoutConstraint.activate(textViewConstraints)
         NSLayoutConstraint.activate(animationViewConstraints)
     }
 }
