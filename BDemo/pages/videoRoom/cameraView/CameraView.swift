//
//  CameraView.swift
//  BDemo
//
//  Created by Jacopo Pappalettera on 02/06/21.
//

import Foundation
import UIKit
import AVFoundation

enum SessionSetupResult {
    case success
    case notAuthorized
    case configurationFailed
}
class CameraView: UIView {
    let session = AVCaptureSession()
    let photoOutput = AVCapturePhotoOutput()
    var previewLayer : AVCaptureVideoPreviewLayer!
    var videoDeviceInput: AVCaptureDeviceInput!
    var setupResult: SessionSetupResult = .success
    var user: FriendUser?{
        didSet {
            self.addNameLabel()
            }
    }
    private var nameLabel: UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureSession()
       
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.configureSession()
    }

    func addNameLabel(){
        let label = UILabel.init()
        self.addSubview(label)
        self.nameLabel = label
        self.nameLabel?.text = self.user?.name
    }
    func configureSession(){
        session.beginConfiguration()
        session.sessionPreset = AVCaptureSession.Preset.photo
        do {
            var defaultVideoDevice: AVCaptureDevice?
            // Choose the back dual camera if available, otherwise default to a wide angle camera.
            let dualCameraDeviceType: AVCaptureDevice.DeviceType
            if #available(iOS 11, *) {
                dualCameraDeviceType = .builtInDualCamera
            } else {
                dualCameraDeviceType = .builtInDuoCamera
            }
            if let dualCameraDevice = AVCaptureDevice.default(dualCameraDeviceType, for: AVMediaType.video, position: .front) {
                defaultVideoDevice = dualCameraDevice
            } else if let backCameraDevice = AVCaptureDevice.default(AVCaptureDevice.DeviceType.builtInWideAngleCamera, for: AVMediaType.video, position: .back) {
                // If the back dual camera is not available, default to the back wide angle camera.
                defaultVideoDevice = backCameraDevice
            } else if let frontCameraDevice = AVCaptureDevice.default(AVCaptureDevice.DeviceType.builtInWideAngleCamera, for: AVMediaType.video, position: .front) {
                defaultVideoDevice = frontCameraDevice
            }
            let videoDeviceInput = try AVCaptureDeviceInput(device: defaultVideoDevice!)
            
            if session.canAddInput(videoDeviceInput) {
                session.addInput(videoDeviceInput)
                self.videoDeviceInput = videoDeviceInput
                
            } else {
                print("Could not add video device input to the session")
                setupResult = .configurationFailed
                session.commitConfiguration()
                return
            }
        } catch {
            print("Could not create video device input: \(error)")
            setupResult = .configurationFailed
            session.commitConfiguration()
            return
        }
        // Add photo output.
        if session.canAddOutput(photoOutput) {
            session.addOutput(photoOutput)
            
            photoOutput.isHighResolutionCaptureEnabled = true
            photoOutput.isLivePhotoCaptureEnabled = photoOutput.isLivePhotoCaptureSupported
        } else {
            print("Could not add photo output to the session")
            setupResult = .configurationFailed
            session.commitConfiguration()
            return
        }
        session.commitConfiguration()
    }
    func start(){
        self.previewLayer = AVCaptureVideoPreviewLayer(session: self.session)
        self.previewLayer.frame = self.bounds
        self.layer.addSublayer(self.previewLayer)
        self.session.startRunning()
    }
    func stop(){
        self.session.stopRunning()
    }
    
    func updateFrames(landscape: Bool = false){
        if let layer = self.previewLayer {
            layer.frame = self.bounds
        }
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        self.updateFrames()
        if let label = self.nameLabel {
            label.frame = CGRect.init(x: (self.bounds.size.width/2)-50, y: 50, width: 100, height: 50)
            label.textColor = .white
            label.font = UIFont.boldSystemFont(ofSize: 20)
            label.textAlignment = .center
            label.backgroundColor = .lightGray
            self.bringSubviewToFront(label)
        }
     
    }
}
