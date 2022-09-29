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
    let date = Date()
    let indexPath = IndexPath()

    // setup
    // tearDown

    func testAddReflection() throws {

        let testAddReflection: () = sut.addReflection(date: date, subject: "subject", textoReflection: "text", emoji: "emoji")

        XCTAssertNotNil(testAddReflection)
    }
    func testfetchReflection() throws {

        let testFetchReflection: () = sut.fetchReflection(date: date)

        XCTAssertNotNil(testFetchReflection)
    }
    func testDeleteReflection() throws {

        let testDeleteReflection: () = sut.deleteReflection(indexPath: indexPath)

        XCTAssertNotNil(testDeleteReflection)
    }
}
