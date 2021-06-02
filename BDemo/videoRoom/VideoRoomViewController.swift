//
//  VideoRoom.swift
//  BDemo
//
//  Created by Jacopo Pappalettera on 02/06/21.
//

import Foundation
import UIKit

class VideoRoomViewController: UIViewController, RoomDelegate {
    @IBOutlet weak var roomView: RoomView!
    
    var currentRoom:Room?
    override func viewDidLoad() {
        super.viewDidLoad()
        let currentUsername = UserDataManager.shared.getUsername()
        
        if (self.currentRoom == nil) {
            let room = Room()
            self.currentRoom = room
            self.currentRoom?.initialize(user: Creator(name: currentUsername))
        }else{
            self.currentRoom?.connect(name: currentUsername)
        }
        self.currentRoom?.delegate = self
    }
    
    @IBAction func addFriend(_ sender: Any) {
        let friend0 = "Pippo"
        self.currentRoom?.connect(name: friend0)
    }
    @IBAction func removeFriend(_ sender: Any) {
        self.currentRoom?.disconnect(friend: (self.currentRoom?.friends.last)!)
    }
    
    
    @IBAction func camera(_ sender: Any) {
        
    }
    @IBAction func microphone(_ sender: Any) {
        
    }
    @IBAction func end(_ sender: Any) {
        
    }
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
         super.viewWillTransition(to: size, with: coordinator)
         if UIDevice.current.orientation.isLandscape {
             print("Landscape")
        //    self.cameraView.updateFrames(landscape:true)
         } else {
             print("Portrait")
          //  self.cameraView.updateFrames()
         }
     }
    // Room delegate
  
    func didAddStream() {
        
    }
    func didRemoveStream() {
        
    }
    func didConnect(friend: FriendUser) {
        self.roomView.addView();
    }
    
    func didDisconnect(friend: FriendUser) {
        self.roomView.removeView();
    }
    
}
