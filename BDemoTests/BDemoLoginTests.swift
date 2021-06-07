//
//  BDemoTests.swift
//  BDemoTests
//
//  Created by Jacopo Pappalettera on 03/06/21.
//

import XCTest
@testable import BDemo

class BDemoLoginTests: XCTestCase {
    override func setUpWithError() throws {
        UserDataManager.shared.cleanCredentials()
    }
    func testClean() throws {
        UserDataManager.shared.cleanCredentials()
        XCTAssertNil(UserDataManager.shared.getUsername())
    }
    func testRegistration() throws{
        XCTAssertNil(UserDataManager.shared.getUsername())
        let username =  "pippo"
        let pwd = "123"
        UserDataManager.shared.performRegistration(username: username, pwd: pwd)
        XCTAssertEqual(UserDataManager.shared.getUsername(), "pippo")
        XCTAssertEqual(UserDataManager.shared.getPwd(), "123")
    }
    func testLogin()throws{
        let username =  "pippo"
        let pwd = "123"
        XCTAssertFalse(UserDataManager.shared.performLogin(username: username, pwd: pwd), "username and pwd must not be present")
        do {
            try testRegistration()
            XCTAssertTrue(UserDataManager.shared.performLogin(username: username, pwd: pwd))
        }
        catch {
            XCTAssert(false)
        }
    }
}
