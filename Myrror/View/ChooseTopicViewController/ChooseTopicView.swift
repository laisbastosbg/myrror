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
    
    let optionLine: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray3
        return view
    }()
    
    let option1Line: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray3
        return view
    }()
    
    let option2Line: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray3
        return view
    }()
    
    let option3Line: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray3
        return view
    }()
    
    let option2: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
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
        label.text = "O que não gostei"
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
        label.text = "O que posso melhorar"
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
        self.addSubview(optionLine)
        self.addSubview(option1)
        option1.addSubview(option1Image)
        option1.addSubview(option1Label)
        option1.addSubview(option1NavigationIcon)
        option1.addSubview(option1Line)
        
        self.addSubview(option2)
        option2.addSubview(option2Image)
        option2.addSubview(option2Label)
        option2.addSubview(option2NavigationIcon)
        option2.addSubview(option2Line)
        
        self.addSubview(option3)
        option3.addSubview(option3Image)
        option3.addSubview(option3Label)
        option3.addSubview(option3NavigationIcon)
        option3.addSubview(option3Line)
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
            
            optionLine.topAnchor.constraint(equalTo: pageTitle.bottomAnchor, constant: 8),
            optionLine.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            optionLine.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            optionLine.heightAnchor.constraint(equalToConstant: 1),
            option1.topAnchor.constraint(equalTo: optionLine.bottomAnchor),
            option1.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            option1.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            option1.heightAnchor.constraint(equalToConstant: 100),
            
            option1Line.topAnchor.constraint(equalTo: option1.bottomAnchor),
            option1Line.heightAnchor.constraint(equalTo: optionLine.heightAnchor),
            option1Line.leadingAnchor.constraint(equalTo: optionLine.leadingAnchor),
            option1Line.trailingAnchor.constraint(equalTo: optionLine.trailingAnchor),
            
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
            
            option2Line.topAnchor.constraint(equalTo: option2.bottomAnchor),
            option2Line.heightAnchor.constraint(equalTo: optionLine.heightAnchor),
            option2Line.leadingAnchor.constraint(equalTo: optionLine.leadingAnchor),
            option2Line.trailingAnchor.constraint(equalTo: optionLine.trailingAnchor),
            
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
            
            option3Line.topAnchor.constraint(equalTo: option3.bottomAnchor),
            option3Line.heightAnchor.constraint(equalTo: optionLine.heightAnchor),
            option3Line.leadingAnchor.constraint(equalTo: optionLine.leadingAnchor),
            option3Line.trailingAnchor.constraint(equalTo: optionLine.trailingAnchor),
            
            option3Image.centerYAnchor.constraint(equalTo: option3.centerYAnchor),
            option3Image.leadingAnchor.constraint(equalTo: option3.leadingAnchor, constant: 8),
            option3Image.heightAnchor.constraint(equalTo: option3.heightAnchor, multiplier: 0.5),
            option3Image.widthAnchor.constraint(equalTo: option3Image.heightAnchor),
            
            option3Label.centerYAnchor.constraint(equalTo: option3.centerYAnchor),
            option3Label.leadingAnchor.constraint(equalTo: option3Image.trailingAnchor, constant: 16),
            
            option3NavigationIcon.centerYAnchor.constraint(equalTo: option3.centerYAnchor),
            option3NavigationIcon.trailingAnchor.constraint(equalTo: option3.trailingAnchor, constant: -8),
        ])
    }

}
