//
//  NewReflectionViewController.swift
//  Myrror
//
//  Created by Lais Godinho on 08/09/22.
//

import UIKit

class NewReflectionViewController: UIViewController {
    
    let navigationTitle : String = "O que aprendi?"

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "Primary")
        
        self.title = navigationTitle
        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationController?.navigationBar.items?[0].backBarButtonItem = UIBarButtonItem(title: "Voltar", style: .plain, target: nil, action: nil)
        
        view.addSubview(confirmationButton)
        configConfirmatioButton()
        
        view.addSubview(reflectionText)
        configReflectionText()
        
        view.addSubview(subTitle)
        configSubTitle()
        
        view.addSubview(backgroundView)
        configBackgroundView()
        
    }
    
    let reflectionText : UITextField = {
        let textField = UITextField()
//        textField.frame = CGRect(x: 10, y: 10, width: 30, height: 10)
        textField.backgroundColor = .systemFill
        textField.layer.cornerRadius = 8
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    func configReflectionText() {
        NSLayoutConstraint.activate([
            reflectionText.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            reflectionText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            reflectionText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
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
    
    let backgroundView : UIView = {
        let background = UIView()
        background.backgroundColor = .systemFill
        background.layer.cornerRadius = 8
        background.translatesAutoresizingMaskIntoConstraints = false
        return background
    }()
    
    func configBackgroundView() {
        NSLayoutConstraint.activate([
            backgroundView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
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
    
    func configConfirmatioButton () {
        NSLayoutConstraint.activate([
            confirmationButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            confirmationButton.centerYAnchor.constraint(equalTo: view.bottomAnchor, constant: -150),
            confirmationButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            confirmationButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            confirmationButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

}
