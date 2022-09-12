//
//  NewReflectionViewController.swift
//  Myrror
//
//  Created by Lais Godinho on 08/09/22.
//

import UIKit

class NewReflectionViewController: UIViewController {
    var selectedTopic: String = "Texto"
    
    lazy var pageTitle : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = selectedTopic
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        label.numberOfLines = 2
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "Primary")
        view.addSubview(pageTitle)
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            pageTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            pageTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            pageTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])
    }

}
