//
//  RetirementCalculatorUITests.swift
//  RetirementCalculatorUITests
//
//  Created by Nadeesha Chandrapala on 14/02/2024.
//

import XCTest

final class RetirementCalculatorUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        XCTContext.runActivity(named: "screenshot") { (activity) in
            let app = XCUIApplication()
            app.launch()

            app.textFields["Monthly investments"].tap()

            let key = app/*@START_MENU_TOKEN@*/.keys["3"]/*[[".keyboards.keys[\"3\"]",".keys[\"3\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
            key.tap()

            let key2 = app/*@START_MENU_TOKEN@*/.keys["0"]/*[[".keyboards.keys[\"0\"]",".keys[\"0\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
            key2.tap()
            key2.tap()
            key2.tap()

            app.textFields["Your current age"].tap()
            key.tap()

            let key3 = app/*@START_MENU_TOKEN@*/.keys["2"]/*[[".keyboards.keys[\"2\"]",".keys[\"2\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
            key3.tap()

            app.textFields["Your planned retirement age"].tap()

            let key4 = app/*@START_MENU_TOKEN@*/.keys["4"]/*[[".keyboards.keys[\"4\"]",".keys[\"4\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
            key4.tap()
            key3.tap()

            app.textFields["Average interest rate of investments"].tap()

            let key5 = app/*@START_MENU_TOKEN@*/.keys["1"]/*[[".keyboards.keys[\"1\"]",".keys[\"1\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
            key5.tap()
            key2.tap()

            app.textFields["Current savings"].tap()
            key5.tap()
            key2.tap()
            key2.tap()
            key2.tap()
            key2.tap()

            app/*@START_MENU_TOKEN@*/.staticTexts["Calculate retirement amount"]/*[[".buttons[\"Calculate retirement amount\"].staticTexts[\"Calculate retirement amount\"]",".staticTexts[\"Calculate retirement amount\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()

            let resultText = app.staticTexts.element(matching: .any, identifier: "resultLabel")
            let result = "If you save $3000.0 every month for 10 years, and invest that money plus your current investment of 10000.0 at a 10.0 anual interest rate, you will have $927712755.1972119 by the time you are 42"

            XCTAssertEqual(resultText.label, result)
        }
    }
}
