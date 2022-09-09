//
//  ViewController.swift
//  Myrror
//
//  Created by Lais Godinho on 08/09/22.
//

import UIKit

class ViewController: UIViewController {
    lazy var navigationButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("proxima tela", for: .normal)
        button.backgroundColor = .tintColor
        button.setTitleColor(UIColor(named: "TextColor"), for: .normal)
        button.addTarget(self, action: #selector(self.navigate), for: .touchUpInside)
        button.layer.shadowColor = CGColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1)
        button.layer.shadowOpacity = 1
        button.layer.cornerRadius = 5
        button.layer.shadowOffset = CGSize(width: 1, height: 5)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .body)
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(navigationButton)
        
        view.backgroundColor = UIColor(named: "Primary")
        
        NSLayoutConstraint.activate([
            navigationButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            navigationButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            navigationButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            navigationButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            navigationButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc func navigate() {
        let nextPage = NewReflectionViewController()
        self.navigationController?.pushViewController(nextPage, animated: true)
    }
}
