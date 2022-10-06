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
        label.text = NSLocalizedString("Sobre o que você gostaria de refletir?", comment: "")
        label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        label.numberOfLines = 2
        return label
    }()
    
    let optionLine: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray3
        return view
    }()
    
    lazy var option1: ChooseSubjectItemView = {
        let option = ChooseSubjectItemView()
        option.translatesAutoresizingMaskIntoConstraints = false
        option.imageName = "brain"
        option.labelText = "O que aprendi"
        return option
    }()
    
    lazy var option2: ChooseSubjectItemView = {
        let option = ChooseSubjectItemView()
        option.translatesAutoresizingMaskIntoConstraints = false
        option.imageName = "upset"
        option.labelText = "O que não gostei"
        return option
    }()
    
    lazy var option3: ChooseSubjectItemView = {
        let option = ChooseSubjectItemView()
        option.translatesAutoresizingMaskIntoConstraints = false
        option.imageName = "plant"
        option.labelText = "O que posso melhorar"
        return option
    }()
    
    lazy var option4: ChooseSubjectItemView = {
        let option = ChooseSubjectItemView()
        option.translatesAutoresizingMaskIntoConstraints = false
        option.imageName = "writing"
        option.labelText = "Tema livre"
        return option
    }()
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor(named: "Primary")
        self.addSubview(pageTitle)
        self.addSubview(optionLine)
        self.addSubview(option1)
        self.addSubview(option2)
        self.addSubview(option3)
        self.addSubview(option4)
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
            option1.leadingAnchor.constraint(equalTo: leadingAnchor),
            option1.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            option2.topAnchor.constraint(equalTo: option1.bottomAnchor),
            option2.leadingAnchor.constraint(equalTo: leadingAnchor),
            option2.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            option3.topAnchor.constraint(equalTo: option2.bottomAnchor),
            option3.leadingAnchor.constraint(equalTo: leadingAnchor),
            option3.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            option4.topAnchor.constraint(equalTo: option3.bottomAnchor),
            option4.leadingAnchor.constraint(equalTo: leadingAnchor),
            option4.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }

}
