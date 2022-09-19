//
//  UnitTestCalendarHelper.swift
//  MyrrorTests
//
//  Created by Marcelo De Araújo on 18/09/22.
//

import XCTest
@testable import Myrror

class UnitTestCalendarHelper: XCTestCase {

    let sut = CalendarHelper()
    let date = Date()
    let calendar = Calendar.current
    let dateFormatter = DateFormatter()

    func testPlusMonth() throws {

        let plusMonth = sut.plusMonth(date: date)

        XCTAssertEqual(plusMonth, calendar.date(byAdding: .month, value: 1,to: date))
    }
    func testMinusMonth() throws {

        let minusMonth = sut.minusMonth(date: date)

        XCTAssertEqual(minusMonth, calendar.date(byAdding: .month, value: -1,to: date))
    }
    func testMonthString() throws {

        let monthString = sut.monthString(date: date)

        XCTAssertNotEqual(monthString, dateFormatter.string(from: date))
    }
    func testYearString() throws {

        let yearString = sut.yearString(date: date)

        XCTAssertNotEqual(yearString, dateFormatter.string(from: date))
    }
    func testDaysInMonth() throws {

        let daysInMonth = sut.daysInMonth(date: date)

        XCTAssertEqual(isEqual(Int(daysInMonth).self),false)
    }
    func testDaysOfMonth() throws {

        let dayOfMonth = sut.dayOfMonth(date: date)

        XCTAssertEqual(isEqual(Int(dayOfMonth).self),false)
    }
    func testFirstOfMonth() throws {

        let firstOfMonth = sut.firstOfMonth(date: date)
        let components = calendar.dateComponents([.year, .month], from: date)

        XCTAssertEqual(firstOfMonth, calendar.date(from: components))
    }
    func testWeekDay() throws {

        let weekDay = sut.weekDay(date: date)

        XCTAssertEqual(isEqual(Int(weekDay).self),false)
    }

}
