//
//  ChooseTopicViewController.swift
//  Myrror
//
//  Created by Christian Paulo on 09/09/22.
//

import UIKit

class ChooseTopicViewController: UIViewController {

    lazy var pageTitle : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Sobre o que você gostaria de refletir?"
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        label.numberOfLines = 2
        return label
    }()
    
    lazy var chooseButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("O que eu aprendi", for: .normal)
        button.configuration = .filled()
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .body)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "Primary")
        view.addSubview(pageTitle)
        view.addSubview(chooseButton)
        
        NSLayoutConstraint.activate([
            pageTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            pageTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            pageTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            chooseButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            chooseButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            chooseButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 48),
            chooseButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -48),
            chooseButton.heightAnchor.constraint(equalToConstant: 48),
        ])
        
    }

}
