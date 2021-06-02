//
//  MenuController.swift
//  BDemo
//
//  Created by Jacopo Pappalettera on 02/06/21.
//

import Foundation
import UIKit

class MenuController: ListController<MenuItem> {
    let menu: [MenuItem] = [
    MenuItem(title: "rooms") {RouterManager.shared.goToRoomsList()},
    MenuItem(title: "contatti") {RouterManager.shared.goToContactList()},
    MenuItem(title: "esci") {
            UserDataManager.shared.cleanCredentials()
            RouterManager.shared.exit()
            return nil
    }];
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func retrieveItems() -> [MenuItem]? {
        return self.menu
    }
    override func retrieveItemText(item: MenuItem) -> String? {
        return item.title
    }
    override func selectAction(item: MenuItem) {
        item.action()
    }
}
