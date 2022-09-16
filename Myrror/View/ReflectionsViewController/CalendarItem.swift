//
//  CalendarItem.swift
//  Myrror
//
//  Created by Lais Godinho on 15/09/22.
//

import Foundation
import UIKit

struct CalendarItem {
    let label: String
    let color: UIColor
    let mood: Mood
}

enum Mood {
    case angry
    case sad
    case neutral
    case happy
    case very_happy
    
    var emoji: UIImage {
        switch self {
        case .angry:
            return UIImage(named: "angry")!
        case .sad:
            return UIImage(named: "sad")!
        case .neutral:
            return UIImage(named: "neutral")!
        case .happy:
            return UIImage(named: "smile")!
        case .very_happy:
            return UIImage(named: "happy")!
        }
    }
}
