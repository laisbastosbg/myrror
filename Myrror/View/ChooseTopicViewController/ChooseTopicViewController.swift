//
//  ChooseTopicViewController.swift
//  Myrror
//
//  Created by Christian Paulo on 09/09/22.
//

import UIKit

class ChooseTopicViewController: UIViewController {
    var screen: ChooseTopicView?
    
    override func loadView() {
        self.screen = ChooseTopicView()
        self.view = self.screen
        
        screen?.option1.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(navigate(sender: ))))
        let swipeGesture1 = UISwipeGestureRecognizer(target: self, action: #selector(navigate(sender: )))
        swipeGesture1.direction = .left
        screen?.option1.addGestureRecognizer(swipeGesture1)
        
        screen?.option2.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(navigate2(sender: ))))
        let swipeGesture2 = UISwipeGestureRecognizer(target: self, action: #selector(navigate2(sender: )))
        swipeGesture2.direction = .left
        screen?.option2.addGestureRecognizer(swipeGesture2)
        
        screen?.option3.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(navigate3(sender: ))))
        let swipeGesture3 = UISwipeGestureRecognizer(target: self, action: #selector(navigate3(sender: )))
        swipeGesture3.direction = .left
        screen?.option3.addGestureRecognizer(swipeGesture3)
        
        screen?.option4.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(navigate4(sender: ))))
        let swipeGesture4 = UISwipeGestureRecognizer(target: self, action: #selector(navigate4(sender: )))
        swipeGesture4.direction = .left
        screen?.option4.addGestureRecognizer(swipeGesture4)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Voltar", style: .plain, target: nil, action: nil)
    }
    
    @objc func navigate(sender: UITapGestureRecognizer) {
        let haptics = UISelectionFeedbackGenerator()
        haptics.selectionChanged()
        let nextPage = NewReflectionViewController()
        guard let screen = screen else {
            return
        }
        nextPage.navigationTitle = screen.option1Label.text!
        nextPage.pageTitle.allowsEditingTextAttributes = false
        self.navigationController?.pushViewController(nextPage, animated: true)
    }
    
    @objc func navigate2(sender: UITapGestureRecognizer) {
        let haptics = UISelectionFeedbackGenerator()
        haptics.selectionChanged()
        let nextPage = NewReflectionViewController()
        guard let screen = screen else {
            return
        }
        nextPage.navigationTitle = screen.option2Label.text!
        nextPage.pageTitle.allowsEditingTextAttributes = false
        self.navigationController?.pushViewController(nextPage, animated: true)
    }
    
    @objc func navigate3(sender: UITapGestureRecognizer) {
        let haptics = UISelectionFeedbackGenerator()
        haptics.selectionChanged()
        let nextPage = NewReflectionViewController()
        guard let screen = screen else {
            return
        }
        nextPage.navigationTitle = screen.option3Label.text!
        nextPage.pageTitle.allowsEditingTextAttributes = false
        self.navigationController?.pushViewController(nextPage, animated: true)
    }
    
    @objc func navigate4(sender: UITapGestureRecognizer) {
        let haptics = UISelectionFeedbackGenerator()
        haptics.selectionChanged()
        let nextPage = NewReflectionViewController()

        nextPage.navigationTitle = "Insira um título"
        nextPage.pageTitle.clearButtonMode = .unlessEditing
        self.navigationController?.pushViewController(nextPage, animated: true)
    }

}
