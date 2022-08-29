//
//  ReferenceiOSUITests.swift
//  ReferenceiOSUITests
//
//  Created by Dunya Kirkali on 27/03/2019.
//  Copyright © 2019 ABN AMRO. All rights reserved.
//
//  Assignment fullfilled by Sharif Kandil on 29/08/2022.

import XCTest


class ReferenceiOSUITests: XCTestCase {
    let  currencyScreenRobot = CurrencyScreenRobot()
    lazy var app: XCUIApplication! = XCUIApplication()

    override func setUp() {
        continueAfterFailure = false
        app.launch()
    }
    override func tearDownWithError() throws {
        app.terminate()
        app = nil
    }

    func testGenerateValue() {

        runActivity("Given coldboot Startupscreen is on screen") { _ in
            currencyScreenRobot.appIsOnStartupScreen()
        }

        runActivity("When button is tapped") { _ in
            currencyScreenRobot.tapButton()
        }
        runActivity("Then label contains a €, is not equal to initial value and represents a value >= 1000000") { _ in
            currencyScreenRobot.labelDisplaysCurrency()
        }

        runActivity("Then the button is hittable again") { _ in
            currencyScreenRobot.tapButton()
            currencyScreenRobot.takeScreenshot()
        }

        //taking a screenshot of testresult for reference
        let screenshot = app.screenshot()
        let attachment = XCTAttachment(screenshot: screenshot)
        attachment.name = "Screenshot for reference"
        attachment.lifetime = .keepAlways
        add(attachment)
    }

    func testGenerateValueDeviceOrientation() {

        runActivity("Given coldboot Startupscreen is on screen in landscape") { _ in
            XCUIDevice.shared.orientation = .landscapeLeft
            currencyScreenRobot.appIsOnStartupScreen()
        }

        runActivity("When button is tapped") { _ in
            currencyScreenRobot.tapButton()

        }
        runActivity("Then label contains a €, is not equal to initial value and represents a value >= 1000") { _ in
            currencyScreenRobot.labelDisplaysCurrency()
        }


        runActivity("Then the button is hittable again in portrait") { _ in
            XCUIDevice.shared.orientation = .portrait
            currencyScreenRobot.tapButton()
            currencyScreenRobot.labelDisplaysCurrency()
        }
    }
    func testAccessibilty() {

        runActivity("Given coldboot Startupscreen is on screen") { _ in
            currencyScreenRobot.appIsOnStartupScreen()
        }

        runActivity("When the screen and button is clicked in various ways") { _ in
            currencyScreenRobot.buttonIsRobust()
            currencyScreenRobot.screenIsRobust()
        }

        runActivity("Then button and currency still work as expected") { _ in
            currencyScreenRobot.tapButton()
            currencyScreenRobot.labelDisplaysCurrency()
        }
    }

    func testPerformance(){
        runActivity("Given the app is open the button performance is acceptable") { _ in
            measure {
                currencyScreenRobot.tapButton()
                currencyScreenRobot.labelDisplaysCurrency()
            }
        }
    }

    func testAppInBackgroundKeepSession(){

        runActivity("Given the app is open and button is tapped") { _ in
            currencyScreenRobot.appIsOnStartupScreen()
            currencyScreenRobot.tapButton()
            currencyScreenRobot.labelDisplaysCurrency()
        }
        runActivity("When the app is put to background and opened again, the session is kept") { _ in
            currencyScreenRobot.putAppToBackground()
            currencyScreenRobot.openApp()
            currencyScreenRobot.labelDisplaysCurrency()
        }

        runActivity("Then the button is hittable after opening app from background") { _ in
            currencyScreenRobot.tapButton()
            currencyScreenRobot.labelDisplaysCurrency()
        }
    }

    //    Ideas for future enhance:
    //    Add screenshot comparison test for UI layout tests and Locale test
    //    changel locale in testplan:

    //    func testChangeLocaleAndLanguage(){
    //
    //        runActivity("Given the app is started with lokale UK the app still represents app lokale currency NL - Euros") { _ in
    //            app.launchArguments = [
    //                "-inUITest",
    //                "-AppleLanguages",
    //                "(uk)",
    //                "-AppleLocale",
    //                "uk_UK",
    //                "-UIPreferredContentSizeCategoryName",
    //                "UICTContentSizeCategoryAccessibilityXL"
    //            ]
    //            app.launch()  
    //        }
    //    }
}


