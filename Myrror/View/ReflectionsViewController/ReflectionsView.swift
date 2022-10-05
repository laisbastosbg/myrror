//
//  CalendarView.swift
//  Myrror
//
//  Created by Lais Godinho on 15/09/22.
//

import UIKit
import Lottie

class ReflectionsView: UIView {
    let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
//        view.accessibilityLabel = "Nenhuma reflexão ainda"
        return view
    }()
    
    let pageTitle: UILabel = {
        let label = UILabel()
        let today = CalendarHelper().getDateAsString(date: Date.now)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        label.text = today
        label.textColor = UIColor(named: "TextColor")
        
        return label
    }()
    
    lazy var optionsButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        button.contentHorizontalAlignment = .right
        button.imageView?.contentMode = .scaleAspectFit
        button.accessibilityLabel = NSLocalizedString("Compartilhar reflexões", comment: "")
        return button
    }()
    
    lazy var calendarButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(toggleCalendar), for: .touchUpInside)
        button.setImage(UIImage(systemName: "calendar"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.contentHorizontalAlignment = .right
        button.accessibilityLabel = NSLocalizedString("Calendário", comment: "")
        return button
    }()
    
    let pageContentStack: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alignment = .center
        view.distribution = .equalCentering
        return view
    }()
    
    let emptyScreenImage: AnimationView = {
        let image = AnimationView()
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = 8
//        image.loopMode = .repeat(1)
        image.animation = Animation.named("nothing")
//        image.accessibilityLabel = emojisName[i]
//        image.isAccessibilityElement = true
//        stackView.addArrangedSubview(image)
        image.translatesAutoresizingMaskIntoConstraints = false
//        image.widthAnchor.constraint(equalTo: image.heightAnchor).isActive = true
//        stackView.isUserInteractionEnabled = true
        
//        image.translatesAutoresizingMaskIntoConstraints = false
//        image.image = UIImage(named: "empty_home")
        return image
    }()
    
    let emptyScreenLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = NSLocalizedString("Nada aqui ainda 😕", comment: "")
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.textColor = UIColor(named: "TextColor")
        
        return label
    }()
    
    let navigationButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(NSLocalizedString("Nova Reflection", comment: ""), for: .normal)
        button.accessibilityLabel = NSLocalizedString("Nova reflexão", comment: "")
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
    
    lazy var reflectionsContainer: UIView = {
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
        button.accessibilityLabel = NSLocalizedString("Ir para o mês anterior", comment: "")
        return button
    }()
    
    lazy var nextMonthButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        button.accessibilityLabel = NSLocalizedString("Ir para o próximo mês", comment: "")
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
    
    lazy var sundayLabel: UILabel = weekDayLabel(text: "Dom", accessibilityLabel: "Domingo")
    
    lazy var mondayLabel: UILabel = weekDayLabel(text: "Seg", accessibilityLabel: "Segunda-feira")
    
    lazy var tuesdayLabel: UILabel = weekDayLabel(text: "Ter", accessibilityLabel: "Terça-feira")
    
    lazy var wednesdayLabel: UILabel = weekDayLabel(text: "Qua", accessibilityLabel: "Quarta-feira")
    
    lazy var thursdayLabel: UILabel = weekDayLabel(text: "Qui", accessibilityLabel: "Quinta-feira")
    
    lazy var fridayLabel: UILabel = weekDayLabel(text: "Sex", accessibilityLabel: "Sexta-feira")
    
    lazy var saturdayLabel: UILabel = weekDayLabel(text: "Sab", accessibilityLabel: "Sábado")
    
    lazy var calendarContainerHeightConstraint: NSLayoutConstraint = {
        self.calendarContainer.heightAnchor.constraint(equalToConstant: 0)
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        self.addSubview(scrollView)
        self.addSubview(pageTitle)
        self.addSubview(calendarButton)
        self.addSubview(optionsButton)
        scrollView.addSubview(pageContentStack)
        self.addSubview(reflectionsContainer)
        pageContentStack.addArrangedSubview(emptyScreenImage)
        pageContentStack.addArrangedSubview(emptyScreenLabel)
        self.addSubview(navigationButton)
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
    
    override func layoutSubviews() {
        emptyScreenImage.play()
        emptyScreenImage.loopMode = .autoReverse
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        let constraints = [
            
            pageTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            pageTitle.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            
            optionsButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            optionsButton.widthAnchor.constraint(equalToConstant: 35),
            optionsButton.heightAnchor.constraint(equalTo: optionsButton.widthAnchor),
            optionsButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            optionsButton.centerYAnchor.constraint(equalTo: pageTitle.centerYAnchor),
            optionsButton.bottomAnchor.constraint(equalTo: calendarContainer.topAnchor),
            
            calendarButton.trailingAnchor.constraint(equalTo: optionsButton.leadingAnchor),
            calendarButton.widthAnchor.constraint(equalTo: optionsButton.widthAnchor),
            calendarButton.heightAnchor.constraint(equalTo: optionsButton.heightAnchor),
            calendarButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            calendarButton.centerYAnchor.constraint(equalTo: pageTitle.centerYAnchor),
            calendarButton.bottomAnchor.constraint(equalTo: calendarContainer.topAnchor),
            
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
            
            pageContentStack.centerYAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.centerYAnchor, constant: -90),
            pageContentStack.centerXAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.centerXAnchor),
            pageContentStack.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            pageContentStack.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            
            scrollView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: calendarContainer.bottomAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            
            reflectionsContainer.topAnchor.constraint(equalTo: calendarContainer.bottomAnchor, constant: 15),
            reflectionsContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            reflectionsContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor),
//            reflectionsContainer.heightAnchor.constraint(equalToConstant: 600),
            reflectionsContainer.bottomAnchor.constraint(equalTo: navigationButton.topAnchor, constant: -20),
            
            navigationButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 48),
            navigationButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -48),
            navigationButton.bottomAnchor.constraint(equalTo: self.keyboardLayoutGuide.topAnchor, constant: -20),
            navigationButton.heightAnchor.constraint(equalToConstant: 48),
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    @objc
    func toggleCalendar() {
        UIView.animate(withDuration: 0.75) {
            self.calendarContainerHeightConstraint.constant = self.calendarContainerHeightConstraint.constant == 0 ? (self.weekDayStack.frame.height + self.bounds.width/8*7) : 0
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
