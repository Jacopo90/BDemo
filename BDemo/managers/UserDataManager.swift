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
    override init() {
        
    }
    func performRegistration(username: String, pwd: String){
        let keychain = KeychainSwift()
        keychain.accessGroup = "private.BDemo"
        keychain.set(username, forKey: "username")
        keychain.set(pwd, forKey: "password")
        print(keychain.accessGroup)
        print(keychain.get("username"))
        print(keychain.get("password"))
    }
    func performLogin(username: String, pwd: String)-> Bool{
        let keychain = KeychainSwift()
        keychain.accessGroup = "private.BDemo"
            if let retrieved_userName = keychain.get("username"),
              let retrieved_password = keychain.get("password") {
                print(retrieved_password)
                print(retrieved_userName)
                return retrieved_userName == username && retrieved_password == pwd;
        }
        return false;
    }
}
