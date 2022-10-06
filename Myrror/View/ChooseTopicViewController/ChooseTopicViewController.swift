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
        configureOptions()

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: NSLocalizedString("Voltar", comment: "Back button"), style: .plain, target: nil, action: nil)
    }
    
    private func configureOptions() {
        screen?.option1.navigationController = self.navigationController
        screen?.option2.navigationController = self.navigationController
        screen?.option3.navigationController = self.navigationController
        screen?.option4.action = self.option4Action
    }
    
    private func option4Action() {
        let haptics = UISelectionFeedbackGenerator()
        haptics.selectionChanged()
        let nextPage = NewReflectionViewController()

        nextPage.navigationTitle = NSLocalizedString("Insira um título", comment: "")
            nextPage.pageTitle.clearButtonMode = .unlessEditing
        self.navigationController?.pushViewController(nextPage, animated: true)
    }

}
