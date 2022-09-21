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
    @Published var reflectionList : [Reflection]?

    //    Referencia ao Container que está no App Delegate
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    // MARK: - CREATE
    func addReflection(subject: String, textoReflection: String, emoji: String) {
        let newReflection = Reflection(context: self.context)
        newReflection.date = Date()
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
    // MARK: - READ
    func fetchReflection() {
        do {
            self.reflectionList = try!context.fetch(Reflection.fetchRequest())

        } catch {
            print("deu errado")
        }
    }
}
