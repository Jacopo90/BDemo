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
    var starterFriend: FriendUser?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let currentUsername = UserDataManager.shared.getUsername()
        if (self.currentRoom == nil) {
            let room = Room(creator: Creator(name: currentUsername))
            room.delegate = self
            self.currentRoom = room
            if let friend = self.starterFriend {
                self.currentRoom?.connect(name: friend.name)
            }
        }else{
            self.roomView.loadRoom(room: self.currentRoom!)
            self.currentRoom!.delegate = self
        }
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
        self.roomView.addView(friend: friend);
    }
    
    func didDisconnect(friend: FriendUser) {
        self.roomView.removeView();
    }
    
}
