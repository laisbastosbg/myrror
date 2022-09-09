//
//  ViewController.swift
//  Myrror
//
//  Created by Lais Godinho on 08/09/22.
//

import UIKit

class ViewController: UIViewController {
    lazy var pageTitle: UILabel = {
        let label = UILabel()
        let dayFormatter = DateFormatter()
        dayFormatter.dateFormat = "dd"
        let day = dayFormatter.string(from: Date.now)
        
        let monthFormatter = DateFormatter()
        monthFormatter.dateFormat = "MMMM"
        let month = monthFormatter.string(from: Date.now)
        
        let today = "\(day) de \(month)"
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        label.text = today
        label.textColor = UIColor(named: "TextColor")
        
        return label
    }()
    
    lazy var calendarButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setImage(UIImage(systemName: "calendar"), for: .normal)
        return button
    }()
    
    lazy var emptyScreenImage: UIImageView = {
        let image = UIImageView()
        
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "empty_home")
        
        return image
    }()
    
    lazy var emptyScreenLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Nada aqui ainda 😕"
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.textColor = UIColor(named: "TextColor")
        
        return label
    }()
    
    lazy var navigationButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Nova Reflection", for: .normal)
        button.configuration = .filled()
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(self.navigate), for: .touchUpInside)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .body)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(navigationButton)
        view.addSubview(pageTitle)
        view.addSubview(calendarButton)
        view.addSubview(emptyScreenImage)
        view.addSubview(emptyScreenLabel)
        
        view.backgroundColor = UIColor(named: "Primary")
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            pageTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            pageTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            
            calendarButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            calendarButton.centerYAnchor.constraint(equalTo: pageTitle.centerYAnchor),
            
            emptyScreenImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emptyScreenImage.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -32),
            emptyScreenImage.heightAnchor.constraint(equalToConstant: 312),
            
            emptyScreenLabel.topAnchor.constraint(equalTo: emptyScreenImage.bottomAnchor, constant: 32),
            emptyScreenLabel.centerXAnchor.constraint(equalTo: emptyScreenImage.centerXAnchor),
            
            
//            navigationButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            navigationButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            navigationButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
            navigationButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 48),
            navigationButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -48),
            navigationButton.heightAnchor.constraint(equalToConstant: 48),
        ])
    }
    
    @objc func navigate() {
        let nextPage = ChooseTopicViewController()
        self.navigationController?.pushViewController(nextPage, animated: true)
    }
}
