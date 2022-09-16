//
//  UnitTestEmojiViewController.swift
//  MyrrorTests
//
//  Created by Marcelo De Araújo on 15/09/22.
//

import XCTest
@testable import Myrror


class UnitTestEmojiViewController: XCTestCase {


    let sut = EmojiViewController()

    func testEmojiName() throws {

        XCTAssertEqual(sut.emojiName, "")
    }

    func testSetupAnimation() throws {

        let setupAnimation = sut.setupAnimation


    }


}
