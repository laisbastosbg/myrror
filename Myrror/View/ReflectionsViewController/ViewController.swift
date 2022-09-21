//
//  ViewController.swift
//  Myrror
//
//  Created by Lais Godinho on 08/09/22.
//

import UIKit
import Lottie

class ViewController: UIViewController {
    
    var screen: ReflectionsView?
    var viewModel = ReflectionViewModel()
    var reflections: [Reflection] = []

    var collectionView: UICollectionView?
    var tableView: UITableView?

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
        viewModel.fetchReflection(date: selectedDate)
        
        self.reflections = viewModel.reflectionList!
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setMonthView()
        
        guard let screen = screen else {
            return
        }
        
        if reflections.count > 0 {
            screen.scrollView.removeFromSuperview()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.items?[0].backBarButtonItem = UIBarButtonItem(title: "Voltar", style: .plain, target: nil, action: nil)
        view.backgroundColor = UIColor(named: "Primary")
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
        collectionView.frame = CGRect(x: 0, y: screen.weekDayStack.frame.maxY, width: view.bounds.width, height: (screen.bounds.width/8*7))
        
        tableView = UITableView()
        
        guard let tableView = tableView else {
            return
        }
        
        screen.reflectionsContainer.addSubview(tableView)
        tableView.register(ReflectionTableViewCell.self, forCellReuseIdentifier: ReflectionTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = screen.reflectionsContainer.bounds
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
    }
    
    func setMonthView() {
        totalSquares.removeAll()
        collectionView?.reloadData()
        
        let daysInMonth = CalendarHelper().daysInMonth(date: selectedDate)
        let firstDayOfMonth = CalendarHelper().firstOfMonth(date: selectedDate)
        let startingSpaces = CalendarHelper().weekDay(date: firstDayOfMonth)
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
            self.collectionView?.frame = CGRect(x: 0, y: 55, width: self.view.bounds.width, height: (self.view.bounds.width/8*7))
        }
        selectedDate = CalendarHelper().minusMonth(date: selectedDate)
        self.screen?.pageTitle.text = CalendarHelper().getDateAsString(date: selectedDate)
        setMonthView()
        viewModel.fetchReflection(date: selectedDate)
        reflections = viewModel.reflectionList!
        tableView?.reloadData()
    }
    
    @objc func nextMonth() {
        let haptics = UIImpactFeedbackGenerator(style: .soft)
        haptics.impactOccurred(intensity: 0.5)
        self.collectionView?.frame = CGRect(x: self.view.bounds.width, y: 55, width: self.view.bounds.width, height: (self.view.bounds.width/8*6)+2)
        
        UIView.animate(withDuration: 1) {
            self.collectionView?.frame = CGRect(x: 0, y: 55, width: self.view.bounds.width, height: (self.view.bounds.width/8*7))
        }
        selectedDate = CalendarHelper().plusMonth(date: selectedDate)
        self.screen?.pageTitle.text = CalendarHelper().getDateAsString(date: selectedDate)
        setMonthView()
        viewModel.fetchReflection(date: selectedDate)
        reflections = viewModel.reflectionList!
        tableView?.reloadData()
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
        myCell.configure(day: day, hide: hide, selectedDate: selectedDate)
        return myCell
    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedDate = CalendarHelper().setDay(date: selectedDate, day: Int(totalSquares[indexPath.item])!)
        self.screen?.pageTitle.text = CalendarHelper().getDateAsString(date: selectedDate)
        collectionView.reloadData()
        viewModel.fetchReflection(date: selectedDate)
        reflections = viewModel.reflectionList!
        tableView?.reloadData()
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

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reflections.count
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myCell = tableView.dequeueReusableCell(withIdentifier: ReflectionTableViewCell.identifier, for: indexPath) as! ReflectionTableViewCell
        myCell.mood.animation = Animation.named(reflections[indexPath.item].emoji!)
        myCell.title.text = reflections[indexPath.item].date?.description
        myCell.reflectionText.text = reflections[indexPath.item].text_reflection
        return myCell
    }
}
