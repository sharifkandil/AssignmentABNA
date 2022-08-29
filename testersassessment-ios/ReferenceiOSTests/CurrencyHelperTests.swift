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
//From this point assessment tests are written by Sharif Kandil
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
    func testFailure() {
        let number: NSNumber = 1.495
        let result = CurrencyHelper.format(amount: number)

        XCTAssertEqual(result, "€ 1.49")
    }

//ideas to workout;
//    Verify if the field accepts numbers only. X
//    Verify if the field accepts symbols for currency. X
//    Verify if the field accepts text character in the text. X
//    Verify if the field allows floating point for currency value.x
//    Check if the field accepts coma for 7 figure numbers.x
//    Check if the field accepts more than 10 digit value within the text box.x
//    Check if the field accepts zero as value in a text field.x
//    Verify if the field accepts negative number.
//    Check if the field accepts number less than zero in floating point.
//    Check if the field accepts dollar sign before or after the number.
//    Check if the field accepts currency sign other than dollar in the text field.
//    Check if the field takes brackets within the text field.
//    Check if the field takes plus sign within the text field.
//    Check if the text field automatically selects the type of the currency to include in the field.
//    Check if the text field accepts no input and still proceeds to next step in the process.
//    Check if the payment goes to checkout with random characters and number in the field
}

