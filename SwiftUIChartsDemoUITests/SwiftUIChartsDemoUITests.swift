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

        let normalized = app.coordinate(withNormalizedOffset: CGVector(dx: 0, dy: 0))
        let coordinate = normalized.withOffset(CGVector(dx: app.frame.midX, dy: app.frame.midY))
        coordinate.press(forDuration: 5)
                
    }
    
    func testFilledLineTouch() throws {

        let app = XCUIApplication()
        app.launch()
        
        app.tables.buttons["Filled Line Chart - Week"].tap()
        
        let normalized = app.coordinate(withNormalizedOffset: CGVector(dx: 0, dy: 0))
        let coordinate = normalized.withOffset(CGVector(dx: app.frame.midX, dy: app.frame.midY))
        coordinate.press(forDuration: 6)

    }
    
    
    func testBarTouch() throws {

        let app = XCUIApplication()
        app.launch()
        
        app.tables.buttons["Bar Chart - Week"].tap()
        
        let normalized = app.coordinate(withNormalizedOffset: CGVector(dx: 0, dy: 0))
        let coordinate = normalized.withOffset(CGVector(dx: app.frame.midX, dy: app.frame.midY))
        coordinate.press(forDuration: 6)
    }
    
        
    
    

}
