//
//  BDemoRoomTest.swift
//  BDemoTests
//
//  Created by Jacopo Pappalettera on 07/06/21.
//

import XCTest
@testable import BDemo

class BDemoRoomTests: XCTestCase {
    var room: Room?
    override func setUpWithError() throws {
        do {
            try testCreateRoom()
        }
        catch {
            XCTAssert(false)
        }
    }
    func testCreateRoom()  throws {
        if let currentUsername = UserDataManager.shared.getUsername(){
            self.room = Room(creator: Creator(name: currentUsername))
            XCTAssert(self.room != nil)
        }
    }
    func testAddRoomInList() throws {
        XCTAssert(self.room != nil)
        XCTAssert(UserDataManager.shared.getRooms().count == 0)
        UserDataManager.shared.addRoom(room: self.room!)
        XCTAssert(UserDataManager.shared.getRooms().count == 1)
    }
    func testRemoveRoomInList() throws {
        do {
            try testAddRoomInList()
            XCTAssert(UserDataManager.shared.getRooms().count == 1)
            UserDataManager.shared.removeRoom(room: self.room!)
            XCTAssert(UserDataManager.shared.getRooms().count == 0)
        }
        catch {
            XCTAssert(false)
        }
    }
    func testAddFriendInRoom()  throws {
        XCTAssert(self.room?.friends.count == 0)
        let friend1 = "Pluto"
        self.room?.connect(name: friend1)
        XCTAssert(self.room?.friends.count == 1)
    }
    func testRemoveFriendInRoom() throws {
        do {
            try testAddFriendInRoom()
            XCTAssert(self.room?.friends.count == 1)
            if let foundFriend = self.room?.friends.first(where: {$0.name == "Pluto"}) {
                self.room?.forceDisconnect(friend: foundFriend)
                XCTAssert(self.room?.friends.count == 0)
            }else{
                XCTAssert(false)
            }
        }
        catch {
            XCTAssert(false)
        }
    
    }

}
