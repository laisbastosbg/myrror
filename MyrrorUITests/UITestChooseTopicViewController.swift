//
//  UITestNewReflection.swift
//  MyrrorUITests
//
//  Created by Marcelo De Araújo on 16/09/22.
//

import XCTest

class UITestChooseTopicViewController: XCTestCase {

    var app: XCUIApplication!

    override func setUp() {

        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments = ["testing"]
        app.launch()
    }

    func testTextFlowAtChooseView() {

        let textChooseTopicViewController = app.staticTexts["Sobre o que você gostaria de refletir?"]
        XCTAssertFalse(textChooseTopicViewController.exists)
    }

    func testButtonFlowAtChooseView1() {

        let buttonOQueEuAprendi = app.buttons["O que eu aprendi"]

        XCTAssertFalse(buttonOQueEuAprendi.exists)
    }

    func testButtonFlowAtChooseView2() {

        let buttonOQueNaoGostei = app.buttons["O que não gostei"]

        XCTAssertFalse(buttonOQueNaoGostei.exists)
    }

    func testButtonFlowAtChooseView3() {

        let buttonOQuePossoMelhorar = app.buttons["O que posso melhorar"]

        XCTAssertFalse(buttonOQuePossoMelhorar.exists)
    }
}
