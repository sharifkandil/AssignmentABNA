//
//  CurrencyHelperTests.swift
//  ReferenceiOSTests
//
//  Created by Dunya Kirkali on 27/03/2019.
//  Copyright © 2019 ABN AMRO. All rights reserved.
//

import XCTest
@testable import ReferenceiOS

class CurrencyHelperTests: XCTestCase {
    func testFormatRounding() {
        let number: NSNumber = 129.999
        let result = CurrencyHelper.format(amount: number)
        
        XCTAssertEqual(result, "€ 130,00")
    }
    
    func testFormatRegular() {
        let number: NSNumber = 122
        let result = CurrencyHelper.format(amount: number)
        
        XCTAssertEqual(result, "€ 122,00")
    }
    
    func testFormatDecimals() {
        let number: NSNumber = 122.50
        let result = CurrencyHelper.format(amount: number)
        
        XCTAssertEqual(result, "€ 122,50")
    }

    func testFormatNegative() {
        let number: NSNumber = -122
        let result = CurrencyHelper.format(amount: number)

        XCTAssertEqual(result, "€ -122,00")
    }

    func testFormatFalse() {
        let number: NSNumber = false
        let result = CurrencyHelper.format(amount: number)

        XCTAssertEqual(result, "€ 0,00")
    }

    func testFormatTrue() {
        let number: NSNumber = true
        let result = CurrencyHelper.format(amount: number)

        XCTAssertEqual(result, "€ 1,00")
    }

    func testFormatValue0() {
        let number: NSNumber = 0
        let result = CurrencyHelper.format(amount: number)

        XCTAssertEqual(result, "€ 0,00")
    }

    func testFormatHighDecimal() {
        let number: NSNumber = 1.0000000000000000
        let result = CurrencyHelper.format(amount: number)

        XCTAssertEqual(result, "€ 1,00")
    }

    func testFormatHighDecimal2() {
        let number: NSNumber = 1.99999999999999999999
        let result = CurrencyHelper.format(amount: number)

        XCTAssertEqual(result, "€ 2,00")
    }

    func testFormatHighAmount() {
        let number: NSNumber = 1234556.234
        let result = CurrencyHelper.format(amount: number)

        XCTAssertEqual(result, "€ 1.234.556,23")
    }

    func testFormatHighAmountRoundUpDecimals() {
        let number: NSNumber = 1234556.235
        let result = CurrencyHelper.format(amount: number)

        XCTAssertEqual(result, "€ 1.234.556,24")
    }

    // This test failure is to test if cases fail when they should fail
    //    func testFailure() {
    //        let number: NSNumber = 1.495
    //        let result = CurrencyHelper.format(amount: number)
    //
    //        XCTAssertEqual(result, "€ 1.49")
    //    }
}

