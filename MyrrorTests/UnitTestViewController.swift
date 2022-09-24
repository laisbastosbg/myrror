//
//  TestViewController.swift
//  MyrrorTests
//
//  Created by Marcelo De Araújo on 12/09/22.
//

import XCTest
@testable import Myrror

class UnitTestViewController: XCTestCase {

    let sut = ViewController()

    func test_varScreen_varSelectedDate_varTotalSquares() throws {

        let testScreen = sut.screen
        let testSelectedDate = sut.selectedDate
        let testTotalSquares = sut.totalSquares
        let testCollectionView = sut.collectionView

        XCTAssertNil(testCollectionView)
        XCTAssertNil(testScreen)
        XCTAssertNotNil(testSelectedDate)
        XCTAssertNotNil(testTotalSquares)

    }

    func test_loadView() throws {

        let testLoadView = sut.loadView

        XCTAssertNotNil(testLoadView)
    }

    func test_viewWillAppear() throws {

        let testViewWillAppear = sut.viewWillAppear

        XCTAssertNotNil(testViewWillAppear)
    }

    func test_viewDidLoad() throws {

        let testViewDidLoad = sut.viewDidLoad

        XCTAssertNotNil(testViewDidLoad)
    }



}
