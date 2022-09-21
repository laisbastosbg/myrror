//
//  UnitTestCalendarItem.swift
//  MyrrorTests
//
//  Created by Marcelo De Araújo on 21/09/22.
//

import XCTest
@testable import Myrror

class UnitTestCalendarItem: XCTestCase {

    let sut = CalendarItem(label: "text", color: UIColor.red, mood: Mood.sad )

    func testCalendarItem() throws {

        XCTAssertEqual(sut.label, "text")
        XCTAssertEqual(sut.color, UIColor.red)
        XCTAssertEqual(sut.mood, Mood.sad)
    }
}
