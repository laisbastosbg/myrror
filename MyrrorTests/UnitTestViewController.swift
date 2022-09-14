//
//  TestViewController.swift
//  MyrrorTests
//
//  Created by Marcelo De Araújo on 12/09/22.
//

import XCTest
@testable import Myrror

class UnitTestViewController: XCTestCase {

    let sut = ViewController()

    func testNavigationButton() throws {

        let button = sut.navigationButton

        XCTAssertEqual(button.backgroundColor, UIColor.tintColor)
        XCTAssertEqual(button.layer.cornerRadius, 5)
        XCTAssertEqual(button.layer.shadowOpacity, 1)
        XCTAssertEqual(button.layer.shadowOffset, CGSize(width: 1, height: 5))
        XCTAssertEqual(button.layer.shadowColor, CGColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1))
        XCTAssertEqual(button.titleLabel?.font, UIFont.preferredFont(forTextStyle: .body))
        
        XCTAssertFalse(button.translatesAutoresizingMaskIntoConstraints)

        XCTAssertNotNil(button.setTitle)
        XCTAssertNotNil(button.setTitleColor)

    }
}
