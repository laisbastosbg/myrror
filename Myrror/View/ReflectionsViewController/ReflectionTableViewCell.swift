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
        
        animationView.contentMode = .scaleToFill
        animationView.layer.cornerRadius = 8
        animationView.accessibilityLabel = "desesperado"
        animationView.isAccessibilityElement = true
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.backgroundColor = .systemBlue
        return animationView
    }()
    
    let container: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "Secondary")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
        self.container.addSubview(mood)
//        self.mood.layer.frame = CGRect(x: container.bounds.minX, y: container.bounds.minY, width: 32, height: 32)
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
            container.heightAnchor.constraint(equalToConstant: 102),
            container.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            mood.topAnchor.constraint(equalTo: container.topAnchor),
            mood.centerYAnchor.constraint(equalTo: container.centerYAnchor),
//            mood.heightAnchor.constraint(equalToConstant: 32),
//            mood.widthAnchor.constraint(equalTo: mood.heightAnchor),
//            mood.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 8),
        ])
    }

}
