//
//  UITestNewReflectionViewController.swift
//  MyrrorUITests
//
//  Created by Marcelo De Araújo on 16/09/22.
//

import XCTest

class UITestNewReflectionViewController: XCTestCase {

    var app: XCUIApplication!

    override func setUp() {

        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments = ["testing"]
        app.launch()
    }

    func testButtonFinalizar() {

        let buttonFinalizar = app.buttons.element
        XCTAssertTrue(buttonFinalizar.exists)
    }

    func testSubTitle() {

        let subTitle = app.staticTexts["Como isso te faz se sentir?"]
        XCTAssertNotNil(subTitle)
    }

}
