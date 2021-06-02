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
    var contactListController: UIViewController?;
    
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
        self.contactListController = self.getControllerFrom(id: "contactList");
        if let navController = self.navController {
            navController.pushViewController(self.contactListController!, animated: true)
        }
    }
    func goToVideoRoom(){
        let videoRoomController = self.getControllerFrom(id: "videoRoom");
        if let navController = self.navController {
            navController.pushViewController(videoRoomController, animated: true)
        }
    }
}
