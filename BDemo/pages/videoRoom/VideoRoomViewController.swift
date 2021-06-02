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
    @IBOutlet weak var meView: CameraView!
    
    var currentRoom:Room?
    var starterFriend: FriendUser?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let room = self.currentRoom {
            room.delegate = self
            if let friend = self.starterFriend {
                room.connect(name: friend.name)
            }
            self.roomView.loadRoom(room: room)
        }
        if let meView = self.meView {
            meView.user = self.currentRoom?.creator
            meView.start()
        }
        
    }
    
    @IBAction func addFriend(_ sender: Any) {
        let friend0 = "Pippo"
        self.currentRoom?.connect(name: friend0)
    }
    @IBAction func removeFriend(_ sender: Any) {
        if let last = self.currentRoom?.friends.last {
            self.currentRoom?.forceDisconnect(friend: last)
        }
    }
    
    
    @IBAction func camera(_ sender: Any) {
        
    }
    @IBAction func microphone(_ sender: Any) {
        
    }
    @IBAction func end(_ sender: Any) {
        self.currentRoom?.exit()
    }
    @IBAction func simulateEnd(_ sender: Any) {
        self.currentRoom?.simulateEnd()
    }
    @IBAction func simulateExitLast(_ sender: Any) {
        if let last = self.currentRoom?.friends.last {
            last.delegate?.exit(user: last)
        }
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
        RouterManager.shared.pop()
    }
    func simulatedidRemoveStream() {
        self.meView.removeFromSuperview()
    }
    func didConnect(friend: FriendUser) {
        self.roomView.addView(friend: friend);
    }
    
    func didDisconnect(friend: FriendUser) {
        self.roomView.removeView();
    }
    
}
