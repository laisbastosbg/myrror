//
//  WeekDayLabel.swift
//  Myrror
//
//  Created by Lais Godinho on 05/10/22.
//

import Foundation
import UIKit

func weekDayLabel(text: String, accessibilityLabel: String) -> UILabel {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = .preferredFont(forTextStyle: .body)
    label.text = NSLocalizedString(text, comment: "")
    label.accessibilityLabel = NSLocalizedString(accessibilityLabel, comment: "")
    return label
}