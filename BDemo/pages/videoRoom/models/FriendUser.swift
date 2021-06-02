//
//  FriendUser.swift
//  BDemo
//
//  Created by Jacopo Pappalettera on 02/06/21.
//

import Foundation
class FriendUser: NSObject {
    var name: String
    var hasAudio: Bool
    var hasVideo: Bool
     init(name: String) {
        self.name = name
        self.hasAudio = true;
        self.hasVideo = true;
    }
}
