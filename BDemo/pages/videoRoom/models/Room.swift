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
    func simulatedidRemoveStream();
}
class Room: NSObject, FriendUserDelegate{
    var identifier: String
    var delegate: RoomDelegate?
    var friends: [FriendUser] = []
    var creator: Creator?
     convenience override init() {
        self.init(creator: nil)
     }
    
     init(creator: Creator?) {
        self.identifier = UUID().uuidString
        super.init()
        self.creator = creator
        self.reset()
    }
   
    func end(){
        self.reset()
    }
    func reset(){
        self.friends = []
    }
    func exit(){
        self.creator = nil
        self.delegate?.didRemoveStream()
    }
    func simulateEnd(){
        self.creator = nil
        self.delegate?.simulatedidRemoveStream()
    }
    func connect(name: String){
        let friend = FriendUser(name: name)
        friend.delegate = self
        self.friends.append(friend)
        if let delegate = self.delegate {
            delegate.didConnect(friend: friend);
        }
    }
    func forceDisconnect(friend: FriendUser){
        self.friends = self.friends.filter { itemFriend in
            return itemFriend.identifier != friend.identifier
        }
        if let delegate = self.delegate {
            delegate.didDisconnect(friend: friend)
        }
    }
    
    // Friend User Delegate
    func enter(user: FriendUser) {
        self.connect(name: user.name)
    }
    
    func exit(user: FriendUser) {
        self.forceDisconnect(friend: user)
    }
    
}
