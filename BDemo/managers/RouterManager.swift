//
//  RouterManager.swift
//  BDemo
//
//  Created by Jacopo Pappalettera on 30/05/21.
//

import Foundation
import UIKit

class RouterManager: NSObject {
    var navController: UINavigationController?;
    
    static let shared = RouterManager()
    override init() {
        super.init()
        
    }
    func getControllerFrom(id: String) -> UIViewController{
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        return mainStoryboard.instantiateViewController(withIdentifier: id)
    }
    func registerNavigationController(navController: UINavigationController){
        self.navController = navController;
    }
    func goToContactList(){
        if let navController = self.navController {
            navController.pushViewController(ContactListViewController(), animated: true)
        }
    }
    func goToVideoRoom(room: Room?, friend:FriendUser? = nil){
        let videoRoomController: VideoRoomViewController = self.getControllerFrom(id: "videoRoom") as! VideoRoomViewController
        videoRoomController.currentRoom = room
        if friend != nil {
            videoRoomController.starterFriend = friend
        }
        if let navController = self.navController {
            navController.pushViewController(videoRoomController, animated: true)
        }
    }
    func goToRoomsList(){
        if let navController = self.navController {
            navController.pushViewController(RoomsViewController(), animated: true)
        }
    }
    func goToMainMenu(){
        if let navController = self.navController {
            navController.pushViewController(MenuController(), animated: true)
        }
    }
    func exit(){
        if let navController = self.navController {
            navController.popToRootViewController(animated: true)
        }
    }
    func pop(){
        if let navController = self.navController {
            navController.popViewController(animated: true)
        }
    }

}
