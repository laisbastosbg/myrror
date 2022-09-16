//
//  CalendarView.swift
//  Myrror
//
//  Created by Lais Godinho on 15/09/22.
//

import UIKit

class ReflectionsView: UIView {
    let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let pageTitle: UILabel = {
        let label = UILabel()
        let dayFormatter = DateFormatter()
        dayFormatter.dateFormat = "dd"
        let day = dayFormatter.string(from: Date.now)
        
        let monthFormatter = DateFormatter()
        monthFormatter.dateFormat = "MMMM"
        let month = monthFormatter.string(from: Date.now)
        
        let today = "\(day) de \(month)"
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        label.text = today
        label.textColor = UIColor(named: "TextColor")
        
        return label
    }()
    
    lazy var calendarButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(toggleCalendar), for: .touchUpInside)
        button.setImage(UIImage(systemName: "calendar"), for: .normal)
        return button
    }()
    
    let pageContentStack: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alignment = .center
        view.distribution = .equalSpacing
        return view
    }()
    
    let emptyScreenImage: UIImageView = {
        let image = UIImageView()
        
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "empty_home")
        return image
    }()
    
    let emptyScreenLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Nada aqui ainda 😕"
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.textColor = UIColor(named: "TextColor")
        
        return label
    }()
    
    let navigationButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Nova Reflection", for: .normal)
        button.configuration = .filled()
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .body)
        
        return button
    }()
    
    lazy var calendarContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
    
    lazy var currentMonth: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Setembro"
        label.font = .preferredFont(forTextStyle: .title2)
        return label
    }()
    
    lazy var previousMonthButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        return button
    }()
    
    lazy var nextMonthButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        return button
    }()
    
    lazy var weekDayStack: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        return stackView
    }()
    
    lazy var sundayLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .body)
        label.text = "Dom"
        return label
    }()
    
    lazy var mondayLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .body)
        label.text = "Seg"
        return label
    }()
    
    lazy var tuesdayLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .body)
        label.text = "Ter"
        return label
    }()
    
    lazy var wednesdayLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .body)
        label.text = "Qua"
        return label
    }()
    
    lazy var thursdayLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .body)
        label.text = "Qui"
        return label
    }()
    
    lazy var fridayLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .body)
        label.text = "Sex"
        return label
    }()
    
    lazy var saturdayLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .body)
        label.text = "Sab"
        return label
    }()
    
    lazy var calendarContainerHeightConstraint: NSLayoutConstraint = {
        self.calendarContainer.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0)
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        self.addSubview(scrollView)
        self.addSubview(pageTitle)
        self.addSubview(calendarButton)
        scrollView.addSubview(pageContentStack)
        pageContentStack.addArrangedSubview(emptyScreenImage)
        pageContentStack.addArrangedSubview(emptyScreenLabel)
        pageContentStack.addArrangedSubview(navigationButton)
        self.addSubview(calendarContainer)
        calendarContainer.addSubview(currentMonth)
        calendarContainer.addSubview(previousMonthButton)
        calendarContainer.addSubview(nextMonthButton)
        calendarContainer.addSubview(weekDayStack)
        weekDayStack.addArrangedSubview(sundayLabel)
        weekDayStack.addArrangedSubview(mondayLabel)
        weekDayStack.addArrangedSubview(tuesdayLabel)
        weekDayStack.addArrangedSubview(wednesdayLabel)
        weekDayStack.addArrangedSubview(thursdayLabel)
        weekDayStack.addArrangedSubview(fridayLabel)
        weekDayStack.addArrangedSubview(saturdayLabel)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        let constraints = [
            
            pageTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            pageTitle.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            
            calendarButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            calendarButton.centerYAnchor.constraint(equalTo: pageTitle.centerYAnchor),
            
            calendarContainer.topAnchor.constraint(equalTo: self.pageTitle.bottomAnchor, constant: 8),
            calendarContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            calendarContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            calendarContainerHeightConstraint,
            
            currentMonth.topAnchor.constraint(equalTo: calendarContainer.topAnchor),
            currentMonth.centerXAnchor.constraint(equalTo: calendarContainer.centerXAnchor),
            
            previousMonthButton.centerYAnchor.constraint(equalTo: currentMonth.centerYAnchor),
            previousMonthButton.leadingAnchor.constraint(equalTo: calendarContainer.leadingAnchor, constant: 16),
            
            nextMonthButton.centerYAnchor.constraint(equalTo: currentMonth.centerYAnchor),
            nextMonthButton.trailingAnchor.constraint(equalTo: calendarContainer.trailingAnchor, constant: -16),
            
            weekDayStack.topAnchor.constraint(equalTo: currentMonth.bottomAnchor),
            weekDayStack.heightAnchor.constraint(equalToConstant: 24),
            weekDayStack.leadingAnchor.constraint(equalTo: previousMonthButton.leadingAnchor),
            weekDayStack.trailingAnchor.constraint(equalTo: nextMonthButton.trailingAnchor),
            weekDayStack.centerXAnchor.constraint(equalTo: calendarContainer.centerXAnchor),
            
            scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: calendarContainer.bottomAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            
            pageContentStack.topAnchor.constraint(equalTo: scrollView.topAnchor),
            pageContentStack.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            pageContentStack.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            pageContentStack.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            navigationButton.topAnchor.constraint(equalTo: emptyScreenLabel.bottomAnchor, constant: 40),
            navigationButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 48),
            navigationButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -48),
            navigationButton.heightAnchor.constraint(equalToConstant: 48),
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    @objc
    func toggleCalendar() {
        UIView.animate(withDuration: 0.75) {
            self.calendarContainerHeightConstraint.constant = self.calendarContainerHeightConstraint.constant == 0 ? UIScreen.main.bounds.height * 0.56 : 0
            
            self.layoutIfNeeded()
            
        }
        
        if self.pageContentStack.subviews.contains(self.emptyScreenImage) {
            self.pageContentStack.removeArrangedSubview(self.emptyScreenImage)
            self.emptyScreenImage.removeFromSuperview()
        } else {
            self.pageContentStack.insertArrangedSubview(self.emptyScreenImage, at: 0)
        }
        
    }
}
