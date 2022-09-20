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

        XCTAssertEqual(button.titleLabel?.font, UIFont.preferredFont(forTextStyle: .body))
        XCTAssertFalse(button.translatesAutoresizingMaskIntoConstraints)
        XCTAssertNotNil(button.setTitle)
        XCTAssertNotNil(button.setTitleColor)
        XCTAssertNotNil(button.configuration)
        XCTAssertNotNil(button.addTarget)
    }

}
