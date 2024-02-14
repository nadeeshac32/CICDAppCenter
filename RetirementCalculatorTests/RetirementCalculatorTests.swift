//
//  RetirementCalculatorTests.swift
//  RetirementCalculatorTests
//
//  Created by Nadeesha Chandrapala on 08/02/2024.
//

import XCTest
@testable import RetirementCalculator

final class RetirementCalculatorTests: XCTestCase {

    var sut: ViewController?
    override func setUpWithError() throws {
        sut = ViewController()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testExample() throws {
        let retirementAmount = sut?.calculateRetirementAmount(current_age: 32, retirement_age: 42, monthly_investment: 1000, current_savings: 1000, interest_rate: 10)
        XCTAssertEqual(retirementAmount, 92915861.853888571)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
