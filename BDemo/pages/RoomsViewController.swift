//
//  RoomsViewController.swift
//  BDemo
//
//  Created by Jacopo Pappalettera on 02/06/21.
//

import Foundation
import UIKit

class RoomsViewController: ListController<Room>{
 
    var allRooms: [Room] = []
    override func viewDidLoad() {
        super.viewDidLoad()
      
        let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(createRoom))
        self.navigationItem.rightBarButtonItems = [add]
    }
    @objc func createRoom(){
        let currentUsername = UserDataManager.shared.getUsername()
        let room = Room(creator: Creator(name: currentUsername))
        UserDataManager.shared.addRoom(room: room)
        self.reload()
    }
    override func retrieveItems() -> [Room]? {
        return UserDataManager.shared.getRooms()
    }
    override func retrieveItemText(item: Room) -> String? {
        return item.identifier
    }
    override func selectAction(item: Room) {
        RouterManager.shared.goToVideoRoom(room: item)
    }
    
}
