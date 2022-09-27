//
//  UnitTestReflectionModel.swift
//  MyrrorTests
//
//  Created by Marcelo De Araújo on 26/09/22.
//

import XCTest
@testable import Myrror

class UnitTestReflectionModel: XCTestCase {

    let sut = ReflectionModel(subject: "subject", text_reflection: "text", emoji: "🧪", date: Date())

    func testReflectionModel() throws {

        XCTAssertEqual(sut.subject, "subject")
        XCTAssertEqual(sut.text_reflection, "text")
        XCTAssertEqual(sut.emoji, "🧪")
        XCTAssertNotNil(sut.date)
    }

}
