//
//  NewReflectionViewController.swift
//  Myrror
//
//  Created by Lais Godinho on 08/09/22.
//

import UIKit

class NewReflectionViewController: UIViewController {
    var navigationTitle : String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "Primary")
        
        navigationController?.navigationBar.items?[1].backBarButtonItem = UIBarButtonItem(title: "Voltar", style: .plain, target: nil, action: nil)
        
        
        view.addSubview(pageTitle)
        configPageTitle()
        
        view.addSubview(confirmationButton)
        configConfirmationButton()
        
        view.addSubview(reflectionText)
        configReflectionText()
        
        view.addSubview(subTitle)
        configSubTitle()
        
        view.addSubview(backgroundView)
        configBackgroundView()
        
//        view.addSubview(angryEmojiButton)
//        configAngryEmojiButton()
    }
    
    lazy var pageTitle : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = navigationTitle
        label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        label.numberOfLines = 2
        return label
    }()
    
    func configPageTitle() {
        NSLayoutConstraint.activate([
            pageTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            pageTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            pageTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
    
    let reflectionText : UITextView = {
        let textView = UITextView()
        textView.frame = CGRect(x: 10, y: 10, width: 30, height: 10)
        textView.contentInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        textView.font = UIFont.preferredFont(forTextStyle: .body)
        textView.textAlignment = .justified
        textView.backgroundColor = .systemFill
        textView.layer.cornerRadius = 8
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    func configReflectionText() {
        NSLayoutConstraint.activate([
            reflectionText.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            reflectionText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18),
            reflectionText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18),
            reflectionText.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            reflectionText.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: -100)
        ])
    }
    
    let subTitle : UILabel = {
        let subTitle = UILabel()
        subTitle.text = "Como isso te faz se sentir?"
        subTitle.font = UIFont.boldSystemFont(ofSize: 20)
        subTitle.translatesAutoresizingMaskIntoConstraints = false
        return subTitle
    }()
    
    func configSubTitle() {
        NSLayoutConstraint.activate([
            subTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            subTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18),
            subTitle.topAnchor.constraint(equalTo: reflectionText.bottomAnchor, constant: 60),
        ])
    }
    
    let backgroundView : UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.backgroundColor = .systemFill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        // MARK: Não esquecer de configurar!!!
        for _ in 1...5 {
            let child = UIButton()
            if let image = UIImage(systemName: "circle.fill") {
                child.setImage(image, for: .normal)
            }
//            child.layer.borderWidth = 1
//            child.layer.borderColor = UIColor.orange.cgColor
            stackView.addArrangedSubview(child)
            child.translatesAutoresizingMaskIntoConstraints = false
            child.widthAnchor.constraint(equalTo: child.heightAnchor).isActive = true
        }
        
        return stackView
    }()
    
    func configBackgroundView() {
        NSLayoutConstraint.activate([
            backgroundView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18),
            backgroundView.topAnchor.constraint(equalTo: subTitle.bottomAnchor, constant: 35),
            backgroundView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    let confirmationButton : UIButton = {
        var configButton = UIButton.Configuration.filled()
        configButton.image = UIImage(systemName: "square.and.arrow.down")
        configButton.title = "Finalizar"
        configButton.imagePadding = 150
                
        let button = UIButton(type: .system)
        button.configuration = configButton
        button.translatesAutoresizingMaskIntoConstraints = false
        button.semanticContentAttribute = .forceRightToLeft

        return button
    }()
    
    func configConfirmationButton () {
        NSLayoutConstraint.activate([
            confirmationButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            confirmationButton.centerYAnchor.constraint(equalTo: view.bottomAnchor, constant: -150),
            confirmationButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            confirmationButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            confirmationButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    let angryEmojiButton : UIButton = {
        let button = UIButton(type: .custom)
        if let image = UIImage(systemName: "circle.fill") {
            button.setImage(image, for: .normal)
        }
        button.setTitle("Emoji", for: .disabled)
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

}
