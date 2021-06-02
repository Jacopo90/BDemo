//
//  VideoRoom.swift
//  BDemo
//
//  Created by Jacopo Pappalettera on 02/06/21.
//

import Foundation
import UIKit

class VideoRoomViewController: UIViewController, RoomDelegate {

    
    @IBOutlet weak var cameraView: CameraView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.cameraView.start();
    }
    @IBAction func camera(_ sender: Any) {
        
    }
    @IBAction func microphone(_ sender: Any) {
        
    }
    @IBAction func end(_ sender: Any) {
        
    }
    
    // Room delegate
  
    func didAddStream() {
        
    }
    func didRemoveStream() {
        
    }
    func didConnect(friend: FriendUser) {
        
    }
    
    func didDisconnect(friend: FriendUser) {
        
    }
    
}
