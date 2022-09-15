//
//  CalendarCollectionViewCell.swift
//  Myrror
//
//  Created by Lais Godinho on 15/09/22.
//

import UIKit

class CalendarCollectionViewCell: UICollectionViewCell {
    static let identifier = "CustomCollectionViewCell"
    
    lazy var dayOfMonth: UILabel = {
        let label = UILabel()
        label.text = "label"
        label.font = .preferredFont(forTextStyle: .footnote)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var moodOfTheDay: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 0.5 * 0.6 * contentView.bounds.size.width
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.contentView.addSubview(dayOfMonth)
        self.contentView.addSubview(moodOfTheDay)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not  been implemented")
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            dayOfMonth.topAnchor.constraint(equalTo: contentView.topAnchor),
            dayOfMonth.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            moodOfTheDay.topAnchor.constraint(equalTo: dayOfMonth.bottomAnchor),
            moodOfTheDay.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            moodOfTheDay.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.6),
            moodOfTheDay.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.6)
        ])
    }
    
    func configure(day: String, hide: Bool) {
        dayOfMonth.text = day
        
        if(hide) {
            moodOfTheDay.backgroundColor = .clear
            moodOfTheDay.image = UIImage()
        } else {
            moodOfTheDay.backgroundColor = .systemGray5
            moodOfTheDay.image = Mood.angry.emoji
            
        }
        
    }
}
