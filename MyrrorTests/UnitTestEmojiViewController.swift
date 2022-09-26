//
//  UnitTestEmojiViewController.swift
//  MyrrorTests
//
//  Created by Marcelo De Araújo on 15/09/22.
//

import XCTest
import Lottie
@testable import Myrror


class UnitTestEmojiViewController: XCTestCase {


    let sut = EmojiViewController()
    var emojiName: String = "sad2"

    func testEmojiName() throws {

        XCTAssertEqual(sut.emojiName, "sad2")
    }
    func testQuadrado() throws {

        let quadrado = sut.quadrado

        XCTAssertNotEqual(quadrado.backgroundColor, UIColor.systemRed)
        XCTAssertNotEqual(quadrado, UIView(frame: CGRect(x: 100, y: 100, width: 30, height: 30)))
    }
    func testSetupAnimation() throws {

        let setupAnimation = sut.setupAnimation

        XCTAssertNotNil(setupAnimation)
    }
    func testAnimationView() throws {

        let test = sut.animationView

        XCTAssertNil(test.backgroundColor)
        XCTAssertEqual(test.contentMode, UIView.ContentMode.scaleAspectFit)
        XCTAssertNotNil(test.frame)

    }
}
