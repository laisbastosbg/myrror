//
//  ActionSheet.swift
//  Myrror
//
//  Created by Beatriz Leonel da Silva on 27/09/22.
//

import UIKit

extension ViewController {
    func presentMenuSheet(indexPath : IndexPath) {
        let actionSheet : UIAlertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let cancelActionButton = UIAlertAction(title: NSLocalizedString("Cancelar", comment: ""), style: .cancel)
        let delectActionButton = UIAlertAction(title: NSLocalizedString("Excluir", comment: ""), style: .destructive){_ in
            self.reflections.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            self.viewModel.deleteReflection(indexPath: indexPath)
            self.updateReflectionList()
        }
        let editActionButton = UIAlertAction(title: NSLocalizedString("Editar", comment: ""), style: .default){ _ in
            let nextPage = NewReflectionViewController()
            let selectedReflection = self.viewModel.reflectionList![indexPath.row]
            nextPage.navigationTitle = selectedReflection.subject!
            nextPage.reflectionText.textColor = UIColor(named: "TextColor") 
            nextPage.reflectionText.text = selectedReflection.text_reflection
            nextPage.selectedEmoji = selectedReflection.emoji!
            nextPage.reflectionIndex = indexPath.row
            nextPage.viewModel = self.viewModel
            self.navigationController?.pushViewController(nextPage, animated: true)
        }
        
        actionSheet.addAction(cancelActionButton)
        actionSheet.addAction(delectActionButton)
        actionSheet.addAction(editActionButton)
        
        self.present(actionSheet, animated: true)
    }
}
