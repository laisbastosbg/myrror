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
        label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        label.numberOfLines = 2
        return label
    }()
    
    lazy var option1Button: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("O que eu aprendi", for: .normal)
        button.configuration = .filled()
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .body)
        button.addTarget(self, action: #selector(self.navigate), for: .touchUpInside)
        return button
    }()
    
    lazy var option2Button: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("O que não gostei", for: .normal)
        button.configuration = .filled()
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .body)
        button.addTarget(self, action: #selector(self.navigate), for: .touchUpInside)
        return button
    }()
    
    lazy var option3Button: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("O que posso melhorar", for: .normal)
        button.configuration = .filled()
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .body)
        button.addTarget(self, action: #selector(self.navigate), for: .touchUpInside)
        return button
    }()
    
    lazy var buttonStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .equalCentering
        stack.alignment = .center
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.items?[0].backBarButtonItem = UIBarButtonItem(title: "Voltar", style: .plain, target: nil, action: nil)
        
        view.backgroundColor = UIColor(named: "Primary")
        view.addSubview(pageTitle)
        view.addSubview(buttonStack)
        buttonStack.addArrangedSubview(option1Button)
        buttonStack.addArrangedSubview(option2Button)
        buttonStack.addArrangedSubview(option3Button)
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            pageTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            pageTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            pageTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            buttonStack.topAnchor.constraint(equalTo: pageTitle.bottomAnchor, constant: 80),
            buttonStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -80),
            buttonStack.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            buttonStack.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            option1Button.leadingAnchor.constraint(equalTo: buttonStack.leadingAnchor, constant: 48),
            option1Button.trailingAnchor.constraint(equalTo: buttonStack.trailingAnchor, constant: -48),
            option1Button.heightAnchor.constraint(equalToConstant: 48),
            
            option2Button.leadingAnchor.constraint(equalTo: buttonStack.leadingAnchor, constant: 48),
            option2Button.trailingAnchor.constraint(equalTo: buttonStack.trailingAnchor, constant: -48),
            option2Button.heightAnchor.constraint(equalToConstant: 48),
            
            option3Button.leadingAnchor.constraint(equalTo: buttonStack.leadingAnchor, constant: 48),
            option3Button.trailingAnchor.constraint(equalTo: buttonStack.trailingAnchor, constant: -48),
            option3Button.heightAnchor.constraint(equalToConstant: 48),
        ])
    }
    
    @objc func navigate(sender: UIButton) {
        let nextPage = NewReflectionViewController()
        nextPage.navigationTitle = sender.currentTitle!
        self.navigationController?.pushViewController(nextPage, animated: true)
    }

}
