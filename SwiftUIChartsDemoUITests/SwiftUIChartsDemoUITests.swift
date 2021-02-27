//
//  SwiftUIChartsDemoUITests.swift
//  SwiftUIChartsDemoUITests
//
//  Created by Will Dale on 25/02/2021.
//

import XCTest

class SwiftUIChartsDemoUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLineTouch() throws {

        let app = XCUIApplication()
        app.launch()
        app.tables.buttons["Line Chart - Week"].tap()
  
        let label = app.staticTexts["Thursday"]
        let exists = NSPredicate(format: "exists == 1")

//        let draggestureElement = app.otherElements["DragGesture"]
        let draggestureElement = app.otherElements["Line Chart"]
        draggestureElement.tap()
        draggestureElement.press(forDuration: 5);
        
        expectation(for: exists, evaluatedWith: label, handler: nil)
        waitForExpectations(timeout: 5, handler: nil)

    }
    
    func testBarTouch() throws {

        let app = XCUIApplication()
        app.launch()
        app.tables.buttons["Bar Chart - Week"].tap()
  
        let label = app.staticTexts["Thursday"]
        let exists = NSPredicate(format: "exists == 1")

//        let draggestureElement = app.otherElements["DragGesture"]
        let draggestureElement = app.otherElements["Bar Chart"]
        draggestureElement.tap()
        draggestureElement.press(forDuration: 5);
                
        expectation(for: exists, evaluatedWith: label, handler: nil)
        waitForExpectations(timeout: 5, handler: nil)

    }

}
