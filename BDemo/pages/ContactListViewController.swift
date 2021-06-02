//
//  ContactListViewController.swift
//  BDemo
//
//  Created by Jacopo Pappalettera on 30/05/21.
//

import Foundation
import UIKit
import ContactsUI
class ContactListViewController: ListController<CNContact>{
    var allRooms: [CNContact] = []
    override func retrieveItems() -> [CNContact]? {
        return ContactsDataManager.shared.fetchContacts()
    }
    override func retrieveItemText(item: CNContact) -> String? {
        return item.givenName + " " +  item.familyName
    }
    override func selectAction(item: CNContact) {
        let name = item.givenName + " " +  item.familyName
        let currentUsername = UserDataManager.shared.getUsername()
        let room = Room(creator: Creator(name: currentUsername))
        RouterManager.shared.goToVideoRoom(room: room, friend: FriendUser(name:name))
    }
}
