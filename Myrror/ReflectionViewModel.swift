//
//  ReflectionViewModel.swift
//  Myrror
//
//  Created by Christian Paulo on 16/09/22.
//

import Foundation
import UIKit
import CoreData

// Copywriter, aprender mais 

class ReflectionViewModel: ObservableObject {
    var reflectionList : [Reflection]?
    
    //    Referencia ao Container que está no App Delegate
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    //    MARK: CREATE
    func addReflection(date: Date, subject: String, textoReflection: String, emoji: String) {
        let newReflection = Reflection(context: self.context)
        newReflection.date = date
        newReflection.subject = subject
        newReflection.text_reflection = textoReflection
        newReflection.emoji = emoji
        
        do {
            try self.context.save()
            print("Deucertoooo \(newReflection)")
        } catch {
            print("deu errado")
        }
    }
    
    // MARK: READ
    func fetchReflection(date: Date) {
        let fetchRequest = Reflection.fetchRequest()
        
        let startDate = Calendar.current.startOfDay(for: date)
        var components = DateComponents()
        components.day = 1
        components.second = -1
        let endDate = Calendar.current.date(byAdding: components, to: startDate)!
        fetchRequest.predicate = NSPredicate(format: "date >= %@ AND date <= %@",
                                             startDate as NSDate, endDate as NSDate)
        do {
            self.reflectionList = try context.fetch(fetchRequest)
        } catch {
            print("deu errado")
        }
    }
    
    func deleteReflection(indexPath: IndexPath) {
        guard let reflectionList = self.reflectionList else {
            return
        }
        do {
            context.delete(reflectionList[indexPath.row])
            self.reflectionList?.remove(at: indexPath.row)
            try self.context.save()
        } catch {
            print("deu errado")
        }
    }
}
