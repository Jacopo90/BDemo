//
//  menuItem.swift
//  BDemo
//
//  Created by Jacopo Pappalettera on 02/06/21.
//

import Foundation
class MenuItem: NSObject {
    let title: String?
    let action: () -> Void?
    
    convenience override init() {
        self.init(title: nil, action:{})
    }
   
    init(title: String?, action: @escaping () -> Void?) {
        self.title = title
        self.action = action
        super.init()
   }
}
