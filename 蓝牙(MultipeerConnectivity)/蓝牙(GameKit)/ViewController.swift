//
//  ViewController.swift
//  蓝牙(GameKit)
//
//  Created by Lei Zhao on 8/28/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit
import MultipeerConnectivity

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, MCSessionDelegate, MCBrowserViewControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    
    var peerID: MCPeerID!
    var mcSession: MCSession!
    var mcAdvertiserAssistant: MCAdvertiserAssistant!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.peerID = MCPeerID(displayName: UIDevice.currentDevice().name)
        self.mcSession = MCSession(peer: peerID, securityIdentity: nil, encryptionPreference: MCEncryptionPreference.Required)
        self.mcSession.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - 连接设备
    @IBAction func startHost(sender: UIButton) {
//        let action = UIAlertAction(title: "start connecting", style: .Default, handler: nil)
        
        NSLog("开始host")
        self.startHosting()
    }
    
    @IBAction func searchDevice(sender: UIButton) {
        NSLog("开始搜索")
        self.joinSession()
    }
    
    @IBAction func stopHosting(sender: UIButton) {
        NSLog("停止分享")
        self.stopSession()
    }
    
    
    func session(session: MCSession, peer peerID: MCPeerID, didChangeState state: MCSessionState) {
        switch state {
        case .Connected:
            NSLog("Connected: \(peerID.displayName)")
        case .Connecting:
            NSLog("Connecting: \(peerID.displayName)")
        case .NotConnected:
            NSLog("Not Connected: \(peerID.displayName)")
        }
    }
    
    func session(session: MCSession, didReceiveStream stream: NSInputStream, withName streamName: String, fromPeer peerID: MCPeerID) {
        
    }
    
    func session(session: MCSession, didStartReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, withProgress progress: NSProgress) {
        
    }
    
    func session(session: MCSession, didFinishReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, atURL localURL: NSURL, withError error: NSError?) {
        
    }
    
    func browserViewControllerDidFinish(browserViewController: MCBrowserViewController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func browserViewControllerWasCancelled(browserViewController: MCBrowserViewController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    func session(session: MCSession, didReceiveData data: NSData, fromPeer peerID: MCPeerID) {
        if let image = UIImage(data: data) {
            dispatch_async(dispatch_get_main_queue(), { 
                self.imageView.image = image
            })
        }
    }
    
    func startHosting() {
        self.mcAdvertiserAssistant = MCAdvertiserAssistant(serviceType: "lzhao-bt", discoveryInfo: nil, session: self.mcSession)
        self.mcAdvertiserAssistant.start()
    }
    
    func joinSession() {
        let mcBrowser = MCBrowserViewController(serviceType: "lzhao-bt", session: self.mcSession)
        mcBrowser.delegate = self
        presentViewController(mcBrowser, animated: true, completion: nil)
    }
    
    func stopSession() {
        self.mcAdvertiserAssistant.stop()
    }
    
    //MARK: - 选择照片
    @IBAction func pickImage(sender: UIButton) {
        
        //1.判断照片源是否可用
        
        /*
         case PhotoLibrary
         case Camera
         case SavedPhotosAlbum
         */
        if !UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.SavedPhotosAlbum) {
            NSLog("照片不可用")
            return
        }
        
        //2.创建照片选择控制器
        
        let picker = UIImagePickerController()
        
        //3.设置照片源
        picker.sourceType = .SavedPhotosAlbum
        
        //4.设置代理
        picker.delegate = self
        
        //5.弹出控制器
        self.presentViewController(picker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        NSLog("\(info)")
        
        //1.取出照片
        self.imageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    //MARK: - 发送照片
    @IBAction func sendImage(sender: UIButton) {
        if mcSession.connectedPeers.count > 0 {
            if let imageData = UIImagePNGRepresentation(self.imageView.image!) {
                do {
                    try self.mcSession.sendData(imageData, toPeers: self.mcSession.connectedPeers, withMode: MCSessionSendDataMode.Reliable)
                    
                } catch let error as NSError {
                    let ac = UIAlertController(title: "Send error", message: error.localizedDescription, preferredStyle: .Alert)
                    ac.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
                    presentViewController(ac, animated: true, completion: nil)
                }
            }
        }
    }


}

