//
//  FriendUser.swift
//  BDemo
//
//  Created by Jacopo Pappalettera on 02/06/21.
//

import Foundation
protocol FriendUserDelegate {
    func enter(user: FriendUser)
    func exit(user: FriendUser)
}
class FriendUser: NSObject {
    var identifier: String
    var name: String
    var hasAudio: Bool
    var hasVideo: Bool
    var delegate: FriendUserDelegate?
     init(name: String) {
        self.identifier = UUID().uuidString
        self.name = name
        self.hasAudio = true;
        self.hasVideo = true;
    }
}
