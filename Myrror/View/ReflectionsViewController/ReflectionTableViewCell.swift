//
//  ReflectionTableViewCell.swift
//  Myrror
//
//  Created by Lais Godinho on 19/09/22.
//

import UIKit
import Lottie

class ReflectionTableViewCell: UITableViewCell {
    static let identifier = "ReflectionTableViewCell"
    let mood: AnimationView = {
        let animationView = AnimationView()
        
        animationView.animation = Animation.named("desesperado")
        
        animationView.contentMode = .scaleAspectFit
        animationView.layer.cornerRadius = 8
        animationView.accessibilityLabel = "desesperado"
        animationView.isAccessibilityElement = true
        animationView.translatesAutoresizingMaskIntoConstraints = false
//        animationView.backgroundColor = .systemBlue
        return animationView
    }()
    
    let container: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.backgroundColor = UIColor(named: "Secondary")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 8
        view.alignment = .top
        view.distribution = .equalSpacing
//        view.clipsToBounds = true
        return view
    }()
    
    let textStack: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.alignment = .top
        view.distribution = .fill
        view.isUserInteractionEnabled = false
        return view
    }()
    
    let title: UITextView = {
        let text = UITextView()
        text.text = "teste"
        text.isEditable = false
        text.font = .preferredFont(forTextStyle: .title3)
        text.backgroundColor = .clear
        text.isScrollEnabled = false
        text.isUserInteractionEnabled = false
        return text
    }()
    
    let reflectionText: UITextView = {
        let label = UITextView()
        label.text = ""
        label.isEditable = false
        label.font = .preferredFont(forTextStyle: .body)
        label.backgroundColor = .clear
        label.textColor = UIColor(named: "SecondaryText")
        label.isScrollEnabled = false
        label.textAlignment = .justified
        label.isUserInteractionEnabled = false
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .clear
        self.contentView.addSubview(container)
        self.container.addArrangedSubview(mood)
        self.container.addArrangedSubview(textStack)
        self.textStack.addArrangedSubview(title)
        self.textStack.addArrangedSubview(reflectionText)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not  been implemented")
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            
            container.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            container.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            container.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            container.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            container.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            mood.topAnchor.constraint(equalTo: container.topAnchor, constant: 8),
            mood.heightAnchor.constraint(equalToConstant: 75),
            title.topAnchor.constraint(equalTo: mood.topAnchor),
            reflectionText.topAnchor.constraint(equalTo: title.bottomAnchor),
            reflectionText.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: 0.75),
            reflectionText.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -8)
        ])
    }

}
