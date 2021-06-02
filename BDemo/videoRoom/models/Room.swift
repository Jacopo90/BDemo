//
//  Room.swift
//  BDemo
//
//  Created by Jacopo Pappalettera on 02/06/21.
//

import Foundation

protocol RoomDelegate {
    func didConnect(friend: FriendUser);
    func didDisconnect(friend: FriendUser);
    func didAddStream();
    func didRemoveStream();
}
class Room: NSObject{
    var delegate: RoomDelegate?
    var friends: [FriendUser] = []
    
    func initialize(user: Creator){
        self.reset()
    }
    func end(){
        self.reset()
    }
    func reset(){
        self.friends = []
    }
    func connect(name: String){
        let friend = FriendUser(name: name)
        self.friends.append(friend)
        if let delegate = self.delegate {
            delegate.didConnect(friend: friend);
        }
    }
    func disconnnect(friend: FriendUser){
        self.friends = self.friends.filter { itemFriend in
            return itemFriend.name != friend.name
        }
        if let delegate = self.delegate {
            delegate.didDisconnect(friend: friend)
        }
    }
}
