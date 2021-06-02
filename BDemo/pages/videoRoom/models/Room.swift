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
    var identifier: String
    var delegate: RoomDelegate?
    var friends: [FriendUser] = []
    
     convenience override init() {
        self.init(creator: nil)
     }
    
     init(creator: Creator?) {
        self.identifier = UUID().uuidString
        super.init()
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
    func disconnect(friend: FriendUser){
        self.friends = self.friends.filter { itemFriend in
            return itemFriend.name != friend.name
        }
        if let delegate = self.delegate {
            delegate.didDisconnect(friend: friend)
        }
    }
}
