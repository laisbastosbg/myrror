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

    func test_viewDidAppear_MustLoadCollectionView() {
        _ = sut.view
        sut.viewDidAppear(true)
        XCTAssertNotNil(sut.isBeingPresented)
    }

    func test_viewDidAppear_ShouldNotAppearWhenCollectionOrScreenIsNil() {
        _ = sut.view
        sut.collectionView.self = nil
        sut.screen = nil
        sut.viewDidAppear(true)

        XCTAssertFalse(sut.isBeingPresented)
    }

    func test_tableViewEditingStyle_ShouldDeleteReflection() {
        _ = sut.view
        let result = sut.tableView.delegate?.tableView?(sut.tableView, editingStyleForRowAt: IndexPath(row: 1, section: 1))
        XCTAssertNil(result)

    }

    func test_heightForHeaderInSection_ShouldHaveNumberOfRowsCount() {

        _ = sut.view
        let numberOfRowsInSection = sut.tableView.numberOfRows(inSection: 0)
        print(numberOfRowsInSection)
        let result = sut.tableView(sut.tableView, heightForHeaderInSection: 0)
        XCTAssertEqual(numberOfRowsInSection, Int(result))
    }

    func test_didSelectRowAt_ShouldBeExecuted() {
        _ = sut.view
        sut.tableView.delegate?.tableView?(sut.tableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        XCTAssertNotNil(sut.tableView.isEditing) 
    }


}
