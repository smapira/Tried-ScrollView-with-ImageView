//
//  Tried_ScrollView_with_ImageViewUITestsLaunchTests.swift
//  Tried-ScrollView-with-ImageViewUITests
//
//  Created by bookair18 on 2022/11/26.
//

import XCTest

class Tried_ScrollView_with_ImageViewUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
