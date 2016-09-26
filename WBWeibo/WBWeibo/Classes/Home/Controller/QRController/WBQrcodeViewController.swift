//
//  WBQrcodeViewController.swift
//  Weibo
//
//  Created by Lei Zhao on 9/16/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit
import AVFoundation

class WBQrcodeViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    
    weak var qrcodeView: WBQrcodeView?
    var link: CADisplayLink?
    
    var session: AVCaptureSession?
    weak var previewLayer: AVCaptureVideoPreviewLayer?
    
    weak var myCardBtn: UIButton?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.green
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "关闭", style: .plain, target: self, action: #selector(self.closeBtnClick))
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "相册", style: .plain, target: self, action: nil)
    
        let qrcodeView = WBQrcodeView()
        self.qrcodeView = qrcodeView
        self.view.addSubview(self.qrcodeView!)
        
        qrcodeView.snp.makeConstraints {[weak self] (make) in
            make.width.equalTo(200)
            make.height.equalTo(200)
            make.center.equalTo((self?.view)!)
        }
        
        
        let btn = UIButton(type: UIButtonType.custom)
        btn.setTitle("My Card", for: UIControlState.normal)
        btn.setTitleColor(UIColor.orange, for: .normal)
        btn.sizeToFit()
        self.view.addSubview(btn)
        
        self.myCardBtn = btn
        
        btn.addTarget(self, action: #selector(self.myCardBtnClick), for: UIControlEvents.touchUpInside)
        
        btn.snp.makeConstraints { [weak self] (make) in
            make.top.equalTo((self?.qrcodeView)!.snp.bottom).offset(38)
            make.centerX.equalTo((self?.view)!)
        }
        
        printLog("QR controller didload")
        
    }
    
    @objc private func myCardBtnClick() {
        let myCardController = WBMyCardViewController()
        myCardController.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(myCardController, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.setupSchedule()
        
        //扫描二维码
        
        //必须使用defaultDevice
        
        //1. 获取输入设备
        let inputDevice = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo)
        // 2. 根据输入设备, 创建输入对象
        
        do {
            let input = try AVCaptureDeviceInput(device: inputDevice)
            
            //3. 创建输出对象
            let output = AVCaptureMetadataOutput()
            //4. 设置输出对象的delegate
            output.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            //5. 创建session, 注意session是一个持久的过程, 所以必须定义成global variable
            let session = AVCaptureSession()
            self.session = session
            //6. 将输入和输出添加到session中, 注意不能重复添加
            if session.canAddInput(input) {
                session.addInput(input)
            }
            
            if session.canAddOutput(output) {
                session.addOutput(output)
            }
            
            //7. 设置输出的数据类型
            output.metadataObjectTypes = [AVMetadataObjectTypeQRCode]
            
            //8. 设置预览界面
            let previewLayer = AVCaptureVideoPreviewLayer(session: session)
            previewLayer?.frame = self.view.bounds
            //        self.view.layer.addSublayer(previewLayer!)
            self.view.layer.insertSublayer(previewLayer!, at: 0)
            self.previewLayer = previewLayer
            //9. 开始采集数据
            session.startRunning()
        }
        catch {
            printLog("Device not support for QRcode scan")
        }
        
        printLog("QR controller will appear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.previewLayer?.removeFromSuperlayer()
        self.session?.stopRunning()
        self.link?.invalidate()
        
        printLog("QR controller did disappear")
    }
    
    @objc func closeBtnClick() {
        self.dismiss(animated: true) {
            self.viewDidDisappear(false)
        }
    }
    
    
    //MARK: - AVCaptureMetadataOutputObjectsDelegate
    func captureOutput(_ captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [Any]!, from connection: AVCaptureConnection!) {
        
        if metadataObjects.count > 0 {
            self.session?.stopRunning()
            
            self.previewLayer?.removeFromSuperlayer()
            
            //AVMetadataMachineReadableCodeObject
            
            let obj = metadataObjects.last
            
            printLog((obj! as AnyObject).stringValue)
            

            self.link?.invalidate()
            
            let label = UILabel(frame: self.view.bounds)
            label.numberOfLines = 0
            label.text = (obj! as AnyObject).stringValue
            self.view.addSubview(label)
        }
        
    }
    
    private func setupSchedule() {
        let link = CADisplayLink(target: self, selector: #selector(self.update))
        self.link = link
        self.link?.add(to: RunLoop.main, forMode: RunLoopMode.defaultRunLoopMode)
    }
    
    @objc private func update() {
        self.qrcodeView?.scanImageViewOffset += 8
        if (self.qrcodeView?.scanImageViewOffset)! >= 170 {
            self.qrcodeView?.scanImageViewOffset = -170
        }
        self.qrcodeView?.scanImageView?.snp.updateConstraints({[weak self] (make) in
            make.top.equalTo((self?.qrcodeView!)!).offset((self!.qrcodeView?.scanImageViewOffset)!)
            })
    }
    
    deinit {
        printLog("qrcode controller close")
    }

}
