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
    var tableView: UITableView = UITableView()
    
    var selectedDate = Date()
    
    var totalSquares: [String] = []
    
    override func loadView() {
        self.screen = ReflectionsView()
        self.view = self.screen
        screen?.currentMonth.text = CalendarHelper().monthString(date: selectedDate) + " " + CalendarHelper().yearString(date: selectedDate)
        screen?.previousMonthButton.addTarget(self, action: #selector(previousMonth), for: .touchUpInside)
        screen?.nextMonthButton.addTarget(self, action: #selector(nextMonth), for: .touchUpInside)
        screen?.navigationButton.addTarget(self, action: #selector(self.navigate), for: .touchUpInside)
        screen?.optionsButton.addTarget(self, action: #selector(self.share), for: .touchUpInside)
        
        let openCalendarGesture = UISwipeGestureRecognizer(target: screen, action: #selector(ReflectionsView.toggleCalendar))
        openCalendarGesture.direction = .down
        screen?.addGestureRecognizer(openCalendarGesture)
        
        let closeCalendarGesture = UISwipeGestureRecognizer(target: screen, action: #selector(ReflectionsView.toggleCalendar))
        closeCalendarGesture.direction = .up
        screen?.calendarContainer.addGestureRecognizer(closeCalendarGesture)
        
        let swipeNext = UISwipeGestureRecognizer(target: self, action: #selector(nextMonth))
        swipeNext.direction = .left
        screen?.calendarContainer.addGestureRecognizer(swipeNext)
        
        let swipePrevious = UISwipeGestureRecognizer(target: self, action: #selector(previousMonth))
        swipePrevious.direction = .right
        screen?.calendarContainer.addGestureRecognizer(swipePrevious)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.totalSquares = []
        self.totalSquares.removeAll()
        updateReflectionList()
        setMonthView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.items?[0].backBarButtonItem = UIBarButtonItem(title: NSLocalizedString("Voltar", comment: "Back button"), style: .plain, target: nil, action: nil)
        view.backgroundColor = UIColor(named: "Primary")
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        guard let screen = screen else {
            return
        }
        
        guard let collectionView = collectionView else {
            return
        }
        
        collectionView.register(CalendarCollectionViewCell.self, forCellWithReuseIdentifier: CalendarCollectionViewCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        screen.calendarContainer.addSubview(collectionView)
        collectionView.backgroundColor = .clear
        collectionView.frame = CGRect(x: 0, y: screen.weekDayStack.frame.maxY, width: view.bounds.width, height: (screen.bounds.width/8*7))
        
        screen.reflectionsContainer.addSubview(tableView)
        tableView.register(ReflectionTableViewCell.self, forCellReuseIdentifier: ReflectionTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        setTableViewConstraints()
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.accessibilityLabel = ""
    }
    
    func setTableViewConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: screen!.reflectionsContainer.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: screen!.reflectionsContainer.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: screen!.reflectionsContainer.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: screen!.reflectionsContainer.trailingAnchor),
        ])
    }
    
    func setMonthView() {
        self.totalSquares = []
        self.totalSquares.removeAll()
        
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
        screen?.reflectionsContainer.frame = CGRect(x: -self.view.bounds.width, y: 55, width: self.view.bounds.width, height: (self.view.bounds.width/8*6)+2)
        screen?.scrollView.frame = CGRect(x: -self.view.bounds.width, y: 55, width: self.view.bounds.width, height: (self.view.bounds.width/8*6)+2)
        
        UIView.animate(withDuration: 0.5) { [self] in
            self.collectionView?.frame = CGRect(x: 0, y: 55, width: self.view.bounds.width, height: (self.view.bounds.width/8*7))
            screen?.reflectionsContainer.frame = CGRect(x: 0, y: 55, width: self.view.bounds.width, height: (self.view.bounds.width/8*7))
            screen?.scrollView.frame = CGRect(x: 0, y: 55, width: self.view.bounds.width, height: (self.view.bounds.width/8*7))
        }
        selectedDate = CalendarHelper().minusMonth(date: selectedDate)
        self.screen?.pageTitle.text = CalendarHelper().getDateAsString(date: selectedDate)
        setMonthView()
        updateReflectionList()
    }
    
    @objc func nextMonth() {
        let haptics = UIImpactFeedbackGenerator(style: .soft)
        haptics.impactOccurred(intensity: 0.5)
        self.collectionView?.frame = CGRect(x: self.view.bounds.width, y: 55, width: self.view.bounds.width, height: (self.view.bounds.width/8*6)+2)
        screen?.reflectionsContainer.frame = CGRect(x: self.view.bounds.width, y: 55, width: self.view.bounds.width, height: (self.view.bounds.width/8*6)+2)
        screen?.scrollView.frame = CGRect(x: self.view.bounds.width, y: 55, width: self.view.bounds.width, height: (self.view.bounds.width/8*6)+2)
        
        UIView.animate(withDuration: 0.5) { [self] in
            self.collectionView?.frame = CGRect(x: 0, y: 55, width: self.view.bounds.width, height: (self.view.bounds.width/8*7))
            screen?.reflectionsContainer.frame = CGRect(x: 0, y: 55, width: self.view.bounds.width, height: (self.view.bounds.width/8*7))
            screen?.scrollView.frame = CGRect(x: 0, y: 55, width: self.view.bounds.width, height: (self.view.bounds.width/8*7))
        }
        selectedDate = CalendarHelper().plusMonth(date: selectedDate)
        self.screen?.pageTitle.text = CalendarHelper().getDateAsString(date: selectedDate)
        setMonthView()
        updateReflectionList()
    }
    
    @objc func navigate() {
        let nextPage = ChooseTopicViewController()
        self.navigationController?.pushViewController(nextPage, animated: true)
    }
    
    func updateReflectionList() {
        viewModel.fetchReflection(date: selectedDate)
        
        self.reflections = viewModel.reflectionList!
        tableView.reloadData()
        if !reflections.isEmpty {
            screen!.scrollView.isHidden = true
        } else {
            screen!.scrollView.isHidden = false
        }
    }
    
    func updateCollectionView() {
        self.totalSquares.removeAll()
        collectionView?.reloadData()
        setMonthView()
    }
    
    @objc func share() {
        if reflections.count > 0 {
            var activityItem = ""
            
            for reflection in reflections {
                let title = "**\(reflection.subject!)**"
                activityItem += title
                if let text = reflection.text_reflection {
                    activityItem += "\n\(text)\n"
                }
            }
            let activityViewController = UIActivityViewController(activityItems: [activityItem], applicationActivities: nil)
            activityViewController.popoverPresentationController?.sourceView = self.screen
            
            self.present(activityViewController, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: NSLocalizedString("Parece que você não tem nada para compartilhar", comment: ""), message: NSLocalizedString("Faça uma reflection primeiro!", comment: ""), preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
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
        if(totalSquares[indexPath.item] != "") {
            selectedDate = CalendarHelper().setDay(date: selectedDate, day: Int(totalSquares[indexPath.item])!)
            self.screen?.pageTitle.text = CalendarHelper().getDateAsString(date: selectedDate)
            collectionView.reloadData()
            viewModel.fetchReflection(date: selectedDate)
            reflections = viewModel.reflectionList!
            tableView.reloadData()
            updateReflectionList()
        }
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presentMenuSheet(indexPath: indexPath)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myCell = tableView.dequeueReusableCell(withIdentifier: ReflectionTableViewCell.identifier, for: indexPath) as! ReflectionTableViewCell
        myCell.mood.animation = Animation.named(reflections[indexPath.item].emoji!)
        myCell.title.text = reflections[indexPath.item].subject
        myCell.reflectionText.text = reflections[indexPath.item].text_reflection
        myCell.selectionStyle = .gray
        myCell.mood.accessibilityLabel = reflections[indexPath.item].emoji
        return myCell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.reflections.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            viewModel.deleteReflection(indexPath: indexPath)
            updateReflectionList()
        }
    }
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let frame: CGRect = tableView.frame
//        
//
//        let exportButton: UIButton = UIButton(frame: CGRectMake(tableView.bounds.maxX-30, 0, 25, 25)) //frame.size.width - 60
////        exportButton.setTitle("Done", for: .normal)
//        exportButton.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
//        exportButton.addTarget(self, action: #selector(share), for: .touchUpInside)
////        exportButton.backgroundColor = UIColor.red
//        
//        let headerView: UIView = UIView(frame: CGRectMake(0, 0, frame.size.width, frame.size.height))
//        headerView.addSubview(exportButton)
//        return headerView
//    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if self.tableView(tableView, numberOfRowsInSection: section) == 0 {
            return 0
        } else {
            return 25
        }
    }
}
