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

        let buttonOQueEuAprendi = app.buttons["O que aprendi"]
        let imageButtonOQueAprendiNav = app.images["chevro.rigth"]
        let imageButtonOQueAprendi = app.images["book"]

        XCTAssertFalse(buttonOQueEuAprendi.exists)
        XCTAssertFalse(imageButtonOQueAprendiNav.exists)
        XCTAssertFalse(imageButtonOQueAprendi.exists)
    }

    func testButtonFlowAtChooseView2() {

        let buttonOQueNaoGostei = app.buttons["O que não gostei"]
        let imageButtonONaoGostei = app.images["upset"]
        let imageButtonONaoGosteiNav = app.images["chevron.right"]

        XCTAssertFalse(buttonOQueNaoGostei.exists)
        XCTAssertFalse(imageButtonONaoGosteiNav.exists)
        XCTAssertFalse(imageButtonONaoGostei.exists)
    }

    func testButtonFlowAtChooseView3() {

        let buttonOQuePossoMelhorar = app.buttons["O que posso melhorar"]
        let imageButtonOQuePossoMelhorarNav = app.images["chevron.right"]
        let imageButtonOQuePossoMelhorar = app.images["plant"]

        XCTAssertFalse(buttonOQuePossoMelhorar.exists)
        XCTAssertFalse(imageButtonOQuePossoMelhorarNav.exists)
        XCTAssertFalse(imageButtonOQuePossoMelhorar.exists)
    }

    func testButtonFlowAtChooseView4() {

        let buttonVoltar = app.buttons["Voltar"]
        let imageButtonVoltar = app.images["chevron.left"]

        XCTAssertFalse(buttonVoltar.exists)
        XCTAssertFalse(imageButtonVoltar.exists)
    }

    func testButtonFlowAtChooseView5() {

        let buttonVoltar = app.buttons["Tema livre"]
        let imageButtonVoltarNav = app.images["chevron.rigth"]
        let imageButtonVoltar = app.images["writing"]

        XCTAssertFalse(buttonVoltar.exists)
        XCTAssertFalse(imageButtonVoltar.exists)
        XCTAssertFalse(imageButtonVoltarNav.exists)
    }
}

