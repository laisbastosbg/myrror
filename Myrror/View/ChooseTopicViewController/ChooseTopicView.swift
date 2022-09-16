//
//  ChooseTopicView.swift
//  Myrror
//
//  Created by Lais Godinho on 16/09/22.
//

import UIKit

class ChooseTopicView: UIView {
    lazy var pageTitle : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Sobre o que você gostaria de refletir?"
        label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        label.numberOfLines = 2
        return label
    }()
    
    let option1: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = 1
        view.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0.7)
        return view
    }()
    
    let option1Image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "book")
        return image
    }()
    
    let option1Label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "O que aprendi"
        label.font = .preferredFont(forTextStyle: .body)
        return label
    }()
    
    let option1NavigationIcon: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "chevron.right")
        return image
    }()
    
    let option2: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = 1
        view.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0.7)
        return view
    }()
    
    let option2Image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "upset")
        return image
    }()
    
    let option2Label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "O não gostei"
        label.font = .preferredFont(forTextStyle: .body)
        return label
    }()
    
    let option2NavigationIcon: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "chevron.right")
        return image
    }()
    
    let option3: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = 1
        view.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0.7)
        return view
    }()
    
    let option3Image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "plant")
        return image
    }()
    
    let option3Label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "O posso melhorar"
        label.font = .preferredFont(forTextStyle: .body)
        return label
    }()
    
    let option3NavigationIcon: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "chevron.right")
        return image
    }()
    
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor(named: "Primary")
        self.addSubview(pageTitle)
        self.addSubview(option1)
        option1.addSubview(option1Image)
        option1.addSubview(option1Label)
        option1.addSubview(option1NavigationIcon)
        
        self.addSubview(option2)
        option2.addSubview(option2Image)
        option2.addSubview(option2Label)
        option2.addSubview(option2NavigationIcon)
        
        self.addSubview(option3)
        option3.addSubview(option3Image)
        option3.addSubview(option3Label)
        option3.addSubview(option3NavigationIcon)
//        self.addSubview(buttonStack)
//        buttonStack.addArrangedSubview(option1Button)
//        buttonStack.addArrangedSubview(option2Button)
//        buttonStack.addArrangedSubview(option3Button)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            pageTitle.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            pageTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            pageTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            
            option1.topAnchor.constraint(equalTo: pageTitle.bottomAnchor, constant: 8),
            option1.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            option1.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            option1.heightAnchor.constraint(equalToConstant: 100),
            
            option1Image.centerYAnchor.constraint(equalTo: option1.centerYAnchor),
            option1Image.leadingAnchor.constraint(equalTo: option1.leadingAnchor, constant: 8),
            option1Image.heightAnchor.constraint(equalTo: option1.heightAnchor, multiplier: 0.5),
            option1Image.widthAnchor.constraint(equalTo: option1Image.heightAnchor),
            
            option1Label.centerYAnchor.constraint(equalTo: option1.centerYAnchor),
            option1Label.leadingAnchor.constraint(equalTo: option1Image.trailingAnchor, constant: 16),
            
            option1NavigationIcon.centerYAnchor.constraint(equalTo: option1.centerYAnchor),
            option1NavigationIcon.trailingAnchor.constraint(equalTo: option1.trailingAnchor, constant: -8),
            
            option2.topAnchor.constraint(equalTo: option1.bottomAnchor),
            option2.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            option2.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            option2.heightAnchor.constraint(equalToConstant: 100),
            
            option2Image.centerYAnchor.constraint(equalTo: option2.centerYAnchor),
            option2Image.leadingAnchor.constraint(equalTo: option2.leadingAnchor, constant: 8),
            option2Image.heightAnchor.constraint(equalTo: option2.heightAnchor, multiplier: 0.5),
            option2Image.widthAnchor.constraint(equalTo: option2Image.heightAnchor),
            
            option2Label.centerYAnchor.constraint(equalTo: option2.centerYAnchor),
            option2Label.leadingAnchor.constraint(equalTo: option2Image.trailingAnchor, constant: 16),
            
            option2NavigationIcon.centerYAnchor.constraint(equalTo: option2.centerYAnchor),
            option2NavigationIcon.trailingAnchor.constraint(equalTo: option2.trailingAnchor, constant: -8),
            
            option3.topAnchor.constraint(equalTo: option2.bottomAnchor),
            option3.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            option3.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            option3.heightAnchor.constraint(equalToConstant: 100),
            
            option3Image.centerYAnchor.constraint(equalTo: option3.centerYAnchor),
            option3Image.leadingAnchor.constraint(equalTo: option3.leadingAnchor, constant: 8),
            option3Image.heightAnchor.constraint(equalTo: option3.heightAnchor, multiplier: 0.5),
            option3Image.widthAnchor.constraint(equalTo: option3Image.heightAnchor),
            
            option3Label.centerYAnchor.constraint(equalTo: option3.centerYAnchor),
            option3Label.leadingAnchor.constraint(equalTo: option3Image.trailingAnchor, constant: 16),
            
            option3NavigationIcon.centerYAnchor.constraint(equalTo: option3.centerYAnchor),
            option3NavigationIcon.trailingAnchor.constraint(equalTo: option3.trailingAnchor, constant: -8),
//            option1NavigationIcon.heightAnchor.constraint(equalTo: option1.heightAnchor, multiplier: 0.3),
//
//            buttonStack.topAnchor.constraint(equalTo: pageTitle.bottomAnchor, constant: 80),
//            buttonStack.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -80),
//            buttonStack.leadingAnchor.constraint(equalTo: self.leadingAnchor),
//            buttonStack.trailingAnchor.constraint(equalTo: self.trailingAnchor),
////
////            option1Button.leadingAnchor.constraint(equalTo: buttonStack.leadingAnchor, constant: 48),
////            option1Button.trailingAnchor.constraint(equalTo: buttonStack.trailingAnchor, constant: -48),
////            option1Button.heightAnchor.constraint(equalToConstant: 48),
//
//            option2Button.leadingAnchor.constraint(equalTo: buttonStack.leadingAnchor, constant: 48),
//            option2Button.trailingAnchor.constraint(equalTo: buttonStack.trailingAnchor, constant: -48),
//            option2Button.heightAnchor.constraint(equalToConstant: 48),
//
//            option3Button.leadingAnchor.constraint(equalTo: buttonStack.leadingAnchor, constant: 48),
//            option3Button.trailingAnchor.constraint(equalTo: buttonStack.trailingAnchor, constant: -48),
//            option3Button.heightAnchor.constraint(equalToConstant: 48),
        ])
    }

}
