//
//  UnitTestreflectionViewModel.swift
//  MyrrorTests
//
//  Created by Marcelo De Araújo on 21/09/22.
//

import XCTest
@testable import Myrror

class UnitTestreflectionViewModel: XCTestCase {

    let sut = ReflectionViewModel()

    func testAddReflection() throws {

        let testAddReflection: () = sut.addReflection(subject: "subject", textoReflection: "text", emoji: "emoji")

        XCTAssertNotNil(testAddReflection)
    }
    func testfetchReflection() throws {

        let testFetchReflection = sut.fetchReflection()

        XCTAssertNotNil(testFetchReflection)
    }
}
