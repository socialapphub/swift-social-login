//
//  SLSingletonTests.swift
//  SLSingletonTests
//
//  Created by Paolo Musolino on 15/01/16.
//  Copyright © 2016 IQUII. All rights reserved.
//

import XCTest
@testable import SocialLogin

class SLSingletonTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSharedInstance() {
        let instance = SLAuthenticationManager.sharedInstance
        XCTAssertNotNil(instance, "")
    }
    
    func testSharedInstance_Unique() {
        let instance1 = SLAuthenticationManager()
        let instance2 = SLAuthenticationManager.sharedInstance
        XCTAssertFalse(instance1 === instance2)
    }
    
    func testSharedInstance_Twice() {
        let instance1 = SLAuthenticationManager.sharedInstance
        let instance2 = SLAuthenticationManager.sharedInstance
        XCTAssertTrue(instance1 === instance2)
    }
    
    func testSharedInstance_ThreadSafety() {
        var instance1 : SLAuthenticationManager!
        var instance2 : SLAuthenticationManager!
        
        let expectation1 = expectationWithDescription("Instance 1")
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
            instance1 = SLAuthenticationManager.sharedInstance
            expectation1.fulfill()
        }
        let expectation2 = expectationWithDescription("Instance 2")
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
            instance2 = SLAuthenticationManager.sharedInstance
            expectation2.fulfill()
        }
        
        waitForExpectationsWithTimeout(1.0) { (_) in
            XCTAssertTrue(instance1 === instance2)
        }
    }
    
}
