//
//  ViewController.swift
//  Myrror
//
//  Created by Lais Godinho on 08/09/22.
//

import UIKit

class ViewController: UIViewController {
    
    var screen: ReflectionsView?
    private var collectionView: UICollectionView?
    var selectedDate = Date()
    var totalSquares = [String]()
    
    override func loadView() {
        self.screen = ReflectionsView()
        self.view = self.screen
        screen?.currentMonth.text = CalendarHelper().monthString(date: selectedDate) + " " + CalendarHelper().yearString(date: selectedDate)
        screen?.previousMonthButton.addTarget(self, action: #selector(previousMonth), for: .touchUpInside)
        screen?.nextMonthButton.addTarget(self, action: #selector(nextMonth), for: .touchUpInside)
        screen?.navigationButton.addTarget(self, action: #selector(self.navigate), for: .touchUpInside)
        
        let swipeNext = UISwipeGestureRecognizer(target: self, action: #selector(nextMonth))
        swipeNext.direction = .left
        screen?.calendarContainer.addGestureRecognizer(swipeNext)
        
        let swipePrevious = UISwipeGestureRecognizer(target: self, action: #selector(previousMonth))
        swipePrevious.direction = .right
        screen?.calendarContainer.addGestureRecognizer(swipePrevious)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setMonthView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.items?[0].backBarButtonItem = UIBarButtonItem(title: "Voltar", style: .plain, target: nil, action: nil)
        view.backgroundColor = UIColor(named: "Primary")
        
        setupConstraints()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        guard let collectionView = collectionView else {
            return
        }
        
        guard let screen = screen else {
            return
        }
        
        
        collectionView.register(CalendarCollectionViewCell.self, forCellWithReuseIdentifier: CalendarCollectionViewCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        screen.calendarContainer.addSubview(collectionView)
        collectionView.backgroundColor = .clear
        collectionView.frame = CGRect(x: 0, y: 55, width: view.bounds.width, height: (screen.bounds.width/8*6)+2)
    }
    
    func setMonthView() {
        totalSquares.removeAll()
        collectionView?.reloadData()
        
        let daysInMonth = CalendarHelper().daysInMonth(date: selectedDate)
        let firstDayOfMonth = CalendarHelper().firstOfMonth(date: selectedDate)
        let startingSpaces = CalendarHelper().weekDay(date: firstDayOfMonth)
        print("firstDayOfMonth: \(firstDayOfMonth)")
        print("startingSpaces: \(startingSpaces)")
        
        var count: Int = 1
        
        while (count <= 42) {
            if (count <= startingSpaces || count - startingSpaces > daysInMonth) {
                totalSquares.append("")
            } else {
                totalSquares.append(String(count - startingSpaces))
            }
            count += 1
        }
        screen?.currentMonth.text = CalendarHelper().monthString(date: selectedDate) + " de " + CalendarHelper().yearString(date: selectedDate)
        collectionView?.reloadData()
    }
    
    @objc func previousMonth() {
        let haptics = UIImpactFeedbackGenerator(style: .soft)
        haptics.impactOccurred(intensity: 0.5)
        self.collectionView?.frame = CGRect(x: -self.view.bounds.width, y: 55, width: self.view.bounds.width, height: (self.view.bounds.width/8*6)+2)
        
        UIView.animate(withDuration: 1) {
            self.collectionView?.frame = CGRect(x: 0, y: 55, width: self.view.bounds.width, height: (self.view.bounds.width/8*6)+2)
        }
        selectedDate = CalendarHelper().minusMonth(date: selectedDate)
        setMonthView()
    }
    
    @objc func nextMonth() {
        let haptics = UIImpactFeedbackGenerator(style: .soft)
        haptics.impactOccurred(intensity: 0.5)
        self.collectionView?.frame = CGRect(x: self.view.bounds.width, y: 55, width: self.view.bounds.width, height: (self.view.bounds.width/8*6)+2)
        
        UIView.animate(withDuration: 1) {
            self.collectionView?.frame = CGRect(x: 0, y: 55, width: self.view.bounds.width, height: (self.view.bounds.width/8*6)+2)
        }
        selectedDate = CalendarHelper().plusMonth(date: selectedDate)
        setMonthView()
    }
    
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
        ])
    }
    
    @objc func navigate() {
        let nextPage = ChooseTopicViewController()
        self.navigationController?.pushViewController(nextPage, animated: true)
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return totalSquares.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: CalendarCollectionViewCell.identifier, for: indexPath) as! CalendarCollectionViewCell
        let day = totalSquares[indexPath.item]
        var hide = false
        if (totalSquares[indexPath.item].count <= 0) {
            hide = true
        }
        myCell.configure(day: day, hide: hide)
        return myCell
    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("User tapped on item \(indexPath.row)")
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
        func collectionView(_ collectionView: UICollectionView,
                            layout collectionViewLayout: UICollectionViewLayout,
                            sizeForItemAt indexPath: IndexPath) -> CGSize {
            guard let screen = screen else {
                fatalError("no")
            }
            return CGSize(width: screen.bounds.width/8, height: screen.bounds.width/8)
        }

        func collectionView(_ collectionView: UICollectionView,
                            layout collectionViewLayout: UICollectionViewLayout,
                            minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 1.0
        }

        func collectionView(_ collectionView: UICollectionView, layout
            collectionViewLayout: UICollectionViewLayout,
                            minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 1.0
        }
    }
