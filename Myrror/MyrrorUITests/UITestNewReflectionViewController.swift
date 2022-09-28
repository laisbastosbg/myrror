//
//  UITestNewReflectionViewController.swift
//  MyrrorUITests
//
//  Created by Marcelo De Araújo on 16/09/22.
//

import XCTest
@testable import Myrror

class UITestNewReflectionViewController: XCTestCase {

    var app: XCUIApplication!

    override func setUp() {

        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments = ["testing"]
        app.launch()
    }
    func testButtonFinalizar() {

        let buttonFinalizar = app.buttons["Finalizar"]
        let imageButtonFinalizar = app.images["square.and.arrow.down"]

        XCTAssertNotNil(buttonFinalizar.exists)
        XCTAssertNotNil(imageButtonFinalizar.exists)
    }
    func testSubTitle() {

        let subTitle = app.staticTexts["Como isso te faz se sentir?"]

        XCTAssertNotNil(subTitle)
    }
    func testButtonEmojis() throws {

        let buttonEmojiFeliz = app.buttons["feliz"]
        let buttonEmojiFelizCinza = app.buttons["feliz-cinza"]
        let buttonEmojiTriste = app.buttons["triste"]
        let buttonEmojiTristeCinza = app.buttons["triste-cinza"]
        let buttonEmojiIndiferente = app.buttons["indiferente"]
        let buttonEmojiIndiferenteCinza = app.buttons["indiferente-cinza"]
        let buttonEmojiConfiante = app.buttons["confiante"]
        let buttonEmojiConfianteCinza = app.buttons["confiante-cinza"]
        let buttonEmojiDesespero = app.buttons["desespero"]
        let buttonEmojiDesesperoCinza = app.buttons["desespero-cinza"]

        XCTAssertNotNil(buttonEmojiFeliz.exists)
        XCTAssertNotNil(buttonEmojiFelizCinza.exists)
        XCTAssertNotNil(buttonEmojiTriste.exists)
        XCTAssertNotNil(buttonEmojiTristeCinza.exists)
        XCTAssertNotNil(buttonEmojiIndiferente.exists)
        XCTAssertNotNil(buttonEmojiIndiferenteCinza.exists)
        XCTAssertNotNil(buttonEmojiConfiante.exists)
        XCTAssertNotNil(buttonEmojiConfianteCinza.exists)
        XCTAssertNotNil(buttonEmojiDesespero.exists)
        XCTAssertNotNil(buttonEmojiDesesperoCinza.exists)

    }

}
