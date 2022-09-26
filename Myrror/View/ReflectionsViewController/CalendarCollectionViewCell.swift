//
//  CalendarCollectionViewCell.swift
//  Myrror
//
//  Created by Lais Godinho on 15/09/22.
//

import UIKit
import Lottie

class CalendarCollectionViewCell: UICollectionViewCell {
    static let identifier = "CustomCollectionViewCell"
    
    lazy var dayOfMonth: UILabel = {
        let label = UILabel()
        label.text = "label"
        label.font = .preferredFont(forTextStyle: .footnote)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
//    lazy var moodOfTheDay: UIImageView = {
//        let view = UIImageView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.layer.cornerRadius = 0.5 * 0.6 * contentView.bounds.size.width
//        return view
//    }()
//
    let moodOfTheDay: AnimationView = {
        let animationView = AnimationView()
        
//        animationView.animation = Animation.named("desesperado")
        
        animationView.contentMode = .scaleAspectFit
        animationView.layer.cornerRadius = 8
//        animationView.accessibilityLabel = "desesperado"
        animationView.isAccessibilityElement = true
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.backgroundColor = .systemBlue
        return animationView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        self.contentView.backgroundColor = .white
        self.contentView.addSubview(moodOfTheDay)
        self.contentView.addSubview(dayOfMonth)
        moodOfTheDay.layer.cornerRadius = 0.5 * 0.6 * contentView.bounds.size.width
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not  been implemented")
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            
            moodOfTheDay.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            moodOfTheDay.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            moodOfTheDay.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.6),
            moodOfTheDay.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.6),
            
            
            dayOfMonth.centerYAnchor.constraint(equalTo: moodOfTheDay.centerYAnchor),
            dayOfMonth.centerXAnchor.constraint(equalTo: moodOfTheDay.centerXAnchor),
        ])
    }
    
    func configure(day: String, hide: Bool, selectedDate: Date) {
        let selectedDateComponents = Calendar.current.dateComponents([.month, .year], from: selectedDate)
        let currentDateComponents = Calendar.current.dateComponents([.month, .year], from: Date())
        let currentDay = Calendar.current.dateComponents([.day], from: Date())
        let selectedDay = Calendar.current.dateComponents([.day], from: selectedDate)
        

        let isCurrentDate = selectedDateComponents == currentDateComponents && day == String(currentDay.day!)
        let isSelectedDate = day == String(selectedDay.day!)
        
        if isCurrentDate && !isSelectedDate {
            dayOfMonth.textColor = .tintColor
//            moodOfTheDay.backgroundColor = .tintColor
        }
        
        if isSelectedDate {
//            dayOfMonth.textColor = UIColor.black
            moodOfTheDay.backgroundColor = .tintColor
//            moodOfTheDay.backgroundColor = .systemGray3
        }
        
        if !isCurrentDate && !isSelectedDate {
            dayOfMonth.textColor = UIColor(named: "TextColor")
            moodOfTheDay.backgroundColor = .systemGray5
        }
        dayOfMonth.text = day
        

        if(hide) {
            moodOfTheDay.backgroundColor = .clear
            moodOfTheDay.animation = nil
        } else {
//            moodOfTheDay.backgroundColor = .systemGray5
//            moodOfTheDay.animation = Animation.named("desesperado")

        }
        
    }
}
