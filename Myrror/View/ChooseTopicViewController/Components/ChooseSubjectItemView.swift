//
//  ChooseSubjectItemView.swift
//  Myrror
//
//  Created by Lais Godinho on 05/10/22.
//

import UIKit

class ChooseSubjectItemView: UIView {
    
    var imageName = "" {
        didSet {
            optionImage.image = UIImage(named: imageName)
        }
    }
    
    var labelText = "" {
        didSet {
            optionLabel.text = NSLocalizedString(labelText, comment: "Reflection Subject")
        }
    }
    
    var labelAccessibilityHint = "botão" {
        didSet {
            optionLabel.accessibilityHint = labelAccessibilityHint
        }
    }
    
    var nextPageNavigationTitle = ""
    var navigationController: UINavigationController? = nil
    var action: (() -> Void)?

    private let optionView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var optionImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var optionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .body)
        return label
    }()
    
    private let optionNavigationIcon: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "chevron.right")
        return image
    }()
    
    private let optionLine: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray3
        return view
    }()
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setConstraints()
        setGestures()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        self.addSubview(optionView)
        optionView.addSubview(optionImage)
        optionView.addSubview(optionLabel)
        optionView.addSubview(optionNavigationIcon)
        optionView.addSubview(optionLine)
    }
    
    func setGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(selector(sender:)))
        self.optionView.addGestureRecognizer(tapGesture)
        
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(selector(sender:)))
        swipeGesture.direction = .left
        self.optionView.addGestureRecognizer(swipeGesture)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            optionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            optionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            optionView.topAnchor.constraint(equalTo: topAnchor),
            optionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            optionView.heightAnchor.constraint(equalToConstant: 100),
            
            optionLine.topAnchor.constraint(equalTo: optionView.bottomAnchor),
            optionLine.leadingAnchor.constraint(equalTo: optionView.leadingAnchor),
            optionLine.trailingAnchor.constraint(equalTo: optionView.trailingAnchor),
            optionLine.heightAnchor.constraint(equalToConstant: 1),
            
            optionImage.centerYAnchor.constraint(equalTo: optionView.centerYAnchor),
            optionImage.leadingAnchor.constraint(equalTo: optionView.leadingAnchor, constant: 8),
            optionImage.heightAnchor.constraint(equalTo: optionView.heightAnchor, multiplier: 0.5),
            optionImage.widthAnchor.constraint(equalTo: optionImage.heightAnchor),
            
            optionLabel.centerYAnchor.constraint(equalTo: optionView.centerYAnchor),
            optionLabel.leadingAnchor.constraint(equalTo: optionImage.trailingAnchor, constant: 16),
            
            optionNavigationIcon.centerYAnchor.constraint(equalTo: optionView.centerYAnchor),
            optionNavigationIcon.trailingAnchor.constraint(equalTo: optionView.trailingAnchor, constant: -8)
        ])
    }
    
    @objc func selector(sender: UITapGestureRecognizer) {
        guard let action = self.action else {
            let haptics = UISelectionFeedbackGenerator()
            haptics.selectionChanged()
            let nextPage = NewReflectionViewController()

            nextPage.navigationTitle = NSLocalizedString(labelText, comment: "")
//            nextPage.pageTitle.clearButtonMode = .unlessEditing
            self.navigationController?.pushViewController(nextPage, animated: true)
            return
        }
        
        action()
    }
    
}
