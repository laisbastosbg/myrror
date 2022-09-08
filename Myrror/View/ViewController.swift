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
        button.addTarget(self, action: #selector(self.navigate), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(navigationButton)
        
        view.backgroundColor = UIColor(named: "Primary")
        
        NSLayoutConstraint.activate([
            navigationButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            navigationButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    
    @objc func navigate() {
        let nextPage = NewReflectionViewController()
        self.navigationController?.pushViewController(nextPage, animated: false)
    }
}
