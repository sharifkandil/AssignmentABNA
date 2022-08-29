//
//  CurrencyScreenRobot.swift
//  ReferenceiOSUITests
//
//  Created by Sharif Kandil on 29/08/2022.
//  Copyright © 2022 ABN AMRO. All rights reserved.
//

import XCTest

class CurrencyScreenRobot {
    var app = XCUIApplication()

    private enum Identifier {
        static let defaultLabelName = "Hello"
    }

    @discardableResult
    func tapButton(file: StaticString = #file, line: UInt = #line) -> Self {
        let button = app.buttons["Button"]
        XCTAssertTrue(button.exists, "Button does not exist", file: file, line: line)
        button.wait(until: \.isHittable)
        button.tap()
        return self
    }

    @discardableResult
    func appIsOnStartupScreen(file: StaticString = #file, line: UInt = #line) -> Self {
        let label = app.staticTexts["label"]
        XCTAssertTrue(label.exists, "Label does not exist", file: file, line: line)
        XCTAssert(app.staticTexts[Identifier.defaultLabelName].exists)
        XCTAssertFalse(label.label.isEmpty)
        XCTAssertEqual(label.label, Identifier.defaultLabelName)
        return self
    }

    @discardableResult
    func labelDisplaysCurrency(file: StaticString = #file, line: UInt = #line) -> Self {
        let label = app.staticTexts["label"]
        XCTAssertTrue(label.exists, "Label does not exist", file: file, line: line)
        XCTAssertFalse(label.label.isEmpty)
        XCTAssertNotNil(label.label.range(of:"€"))
        XCTAssertNotEqual(label.label,Identifier.defaultLabelName)

        let removeCharacters: Set<Character> = [" ", "€", "."]
        var labelWithout = label.label
        labelWithout.removeAll(where: { removeCharacters.contains($0) } )
        let myInt3 = (labelWithout as NSString).integerValue
        XCTAssertGreaterThanOrEqual(myInt3, 100)
        return self
    }

    @discardableResult
    func buttonIsRobust(file: StaticString = #file, line: UInt = #line) -> Self {
        let button = app.buttons["Button"]
        XCTAssertTrue(button.exists, "Button does not exist")
        button.wait(until: \.isHittable)
        button.tap()
        button.doubleTap()
        button.press(forDuration: 5)
        return self
    }
    @discardableResult
    func screenIsRobust() -> Self {
        let label = app.staticTexts["label"]
        XCTAssertTrue(label.exists, "Label does not exist")
        app.swipeLeft()
        app.swipeRight()
        app.swipeUp()
        app.swipeDown()
        XCTAssert(label.frame.size.height >= 18)
        XCTAssert(label.frame.size.width >= 18)
        return self
    }

    @discardableResult
    func putAppToBackground(file: StaticString = #file, line: UInt = #line) -> Self {
        XCUIDevice.shared.press(.home)
        return self
    }

    @discardableResult
    func openApp(file: StaticString = #file, line: UInt = #line) -> Self {
        sleep(2) //added to remove flakyness
        app.activate()
        return self
    }

    @discardableResult
    func takeScreenshot(file: StaticString = #file, line: UInt = #line) -> Self {
        let screenshot = app.screenshot()
        let attachment = XCTAttachment(screenshot: screenshot)
        attachment.name = "Screenshot for reference"
        attachment.lifetime = .keepAlways
        return self
    }
}

