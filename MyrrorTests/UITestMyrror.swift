//
//  UITestMyrror.swift
//  MyrrorTests
//
//  Created by Marcelo De Araújo on 15/09/22.
//

import XCTest
@testable import Myrror

final class UITestMyrror: XCTestCase {

    var app: XCUIApplication!

    override func setUpWithError() throws {

        try super.setUpWithError()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()

    }

    func testExample() throws {

        let button = app.buttons.element(matching: NSPredicate(format: "image == %@", UIImage(systemName: "calendar")!))
        let app = XCUIApplication()
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
