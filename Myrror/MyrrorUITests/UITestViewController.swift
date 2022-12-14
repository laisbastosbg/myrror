//
//  UITestMyrror.swift
//  MyrrorTests
//
//  Created by Marcelo De Araújo on 15/09/22.
//

import XCTest
@testable import Myrror

class UITestMyrror: XCTestCase {

    var app: XCUIApplication!

    override func setUp() {

        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments = ["testing"]
        app.launch()
    }

    func testImageFlow() throws {
        let image = app.images["empty_home"]
        XCTAssertFalse(image.exists)
    }

    func testTextFlow() throws {

        let textViewController = app.staticTexts["Nada aqui ainda"]
        XCTAssertFalse(textViewController.exists)
    }

    func testButtonFlow() throws {

        let buttonViewController = app.buttons["Nova Reflection"]
        XCTAssertTrue(buttonViewController.exists)
        buttonViewController.tap()
        XCTAssertFalse(buttonViewController.exists)
    }
    func testButtonCalendarFlow() throws {

        let buttonCalendar = app.buttons["calendar"]
        XCTAssertTrue(buttonCalendar.exists)
        buttonCalendar.tap()
        XCTAssertTrue(buttonCalendar.exists)
    }
    func testButtonCompartilharFlow() throws {

        let buttonCompartilhar = app.buttons["Share"]
        XCTAssertTrue(buttonCompartilhar.exists)
        buttonCompartilhar.tap()
        XCTAssertTrue(buttonCompartilhar.exists)
    }
    func testActionSheet() throws {

        let buttonCancelActionButton = app.sheets.buttons["Cancelar"]
        let buttonDelectActionButton = app.sheets.buttons["Excluir"]
        let buttonEditActionButton = app.sheets.buttons["Editar"]

        

        XCTAssertFalse(buttonCancelActionButton.exists)
        XCTAssertFalse(buttonDelectActionButton.exists)
        XCTAssertFalse(buttonEditActionButton.exists)

    }
}
