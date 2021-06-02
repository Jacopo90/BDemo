//
//  UserDataManager.swift
//  BDemo
//
//  Created by Jacopo Pappalettera on 30/05/21.
//

import Foundation
import KeychainSwift

class UserDataManager: NSObject {
    static let shared = UserDataManager()
    let keyChain = KeychainSwift()
    override init() {
        self.keyChain.accessGroup = "UUVDK94NSQ.private.BDemo"
    }
    func performRegistration(username: String, pwd: String){
        self.keyChain.set(username, forKey: "username")
        self.keyChain.set(pwd, forKey: "password")
        print(self.keyChain.get("username")!)
        print(self.keyChain.get("password")!)
    }
    func performLogin(username: String, pwd: String)-> Bool{
            if let retrieved_userName = self.keyChain.get("username"),
              let retrieved_password = self.keyChain.get("password") {
                print(retrieved_password)
                print(retrieved_userName)
                return retrieved_userName == username && retrieved_password == pwd;
        }
        return false;
    }
    
    func getUsername() -> String{
        return self.keyChain.get("username")!
    }
    func clean() {
        self.keyChain.clear()
    }
}
