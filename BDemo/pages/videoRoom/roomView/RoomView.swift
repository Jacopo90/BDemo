//
//  RoomView.swift
//  BDemo
//
//  Created by Jacopo Pappalettera on 02/06/21.
//

import Foundation
import UIKit
class RoomView: UIView {
    var cameraViews: [CameraView]?
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.cameraViews = []
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.cameraViews = []
    }
    func addView(friend: FriendUser){
        let cameraView = CameraView()
        cameraView.user = friend
        cameraView.start()
        self.cameraViews?.append(cameraView)
        self.addSubview(cameraView);
        self.layoutIfNeeded()
    }
    func removeView(){
        self.cameraViews?.removeLast()
        self.subviews.forEach { view in
            view.removeFromSuperview()
        }
        self.cameraViews?.forEach({ cameraview in
            self.addSubview(cameraview)
        })
        self.layoutIfNeeded()
    }
    func loadRoom(room: Room){
        self.cameraViews?.removeAll()
        self.subviews.forEach { view in
            view.removeFromSuperview()
        }
        room.friends.forEach { friend in
            self.addView(friend: friend)
        }
    }
    override func layoutSubviews() {
        if let views = self.cameraViews {
            if views.count == 1 {
                views[0].frame = CGRect.init(origin: CGPoint.init(x: 0,y: 0),
                                         size: CGSize.init(width: self.bounds.size.width, height: self.bounds.size.height))
            }
            if views.count == 2 {
                views[0].frame = CGRect.init(origin: CGPoint.init(x: 0,y: 0),
                                         size: CGSize.init(width: self.bounds.size.width, height: self.bounds.size.height/2))
                views[1].frame = CGRect.init(origin: CGPoint.init(x: 0,y:  self.bounds.size.height/2),
                                         size: CGSize.init(width: self.bounds.size.width, height: self.bounds.size.height/2))
            }
            if views.count == 3 {
                views[0].frame = CGRect.init(origin: CGPoint.init(x: 0,y: 0),
                                         size: CGSize.init(width: self.bounds.size.width/2, height: self.bounds.size.height/2))
                views[1].frame = CGRect.init(origin: CGPoint.init(x: self.bounds.size.width/2,y:  0),
                                         size: CGSize.init(width: self.bounds.size.width/2, height: self.bounds.size.height/2))
                views[2].frame = CGRect.init(origin: CGPoint.init(x: 0,y:  self.bounds.size.height/2),
                                         size: CGSize.init(width: self.bounds.size.width, height: self.bounds.size.height/2))
            }
            if views.count == 4 {
                views[0].frame = CGRect.init(origin: CGPoint.init(x: 0,y: 0),
                                         size: CGSize.init(width: self.bounds.size.width/2, height: self.bounds.size.height/2))
                views[1].frame = CGRect.init(origin: CGPoint.init(x: self.bounds.size.width/2,y: 0),
                                         size: CGSize.init(width: self.bounds.size.width/2, height: self.bounds.size.height/2))
                views[2].frame = CGRect.init(origin: CGPoint.init(x: 0,y:  self.bounds.size.height/2),
                                         size: CGSize.init(width: self.bounds.size.width/2, height: self.bounds.size.height/2))
                views[3].frame = CGRect.init(origin: CGPoint.init(x: self.bounds.size.width/2,y:  self.bounds.size.height/2),
                                         size: CGSize.init(width: self.bounds.size.width/2, height: self.bounds.size.height/2))
            }
        }
    }
}
