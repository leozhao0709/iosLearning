//
//  WBComposeViewController.swift
//  WBWeibo
//
//  Created by Lei Zhao on 10/20/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit
import Alamofire
import KRProgressHUD

class WBComposeViewController: UIViewController, UITextViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate,  WBComposeCollectionViewCellDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var collectionViewLayout: UICollectionViewFlowLayout!
    
    lazy var images: [UIImage] = {
       return []
    }()
    
    weak var input: WBInputTextView?
    weak var toolBar: WBInputToolbarView?
    @IBOutlet weak var inputContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.setupNav()
        self.setupTextView()
        self.setupToolBar()
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        self.collectionView.register(WBComposeCollectionViewCell.self, forCellWithReuseIdentifier: "photoCell")
    }
    
    
    private func setupNav() {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "取消", style: UIBarButtonItemStyle.plain, target: self, action: #selector(self.close))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "发送", style: UIBarButtonItemStyle.plain, target: self, action: #selector(self.compose))
    }
    
    private func setupTextView() {
        let input = WBInputTextView()
        input.placeholder = "请输入要分享的内容..."
        input.alwaysBounceVertical = true
        input.delegate = self

        self.inputContainer.addSubview(input)
        
        self.input = input
        self.navigationItem.rightBarButtonItem?.isEnabled = false
    }
    
    private func setupToolBar() {
        let toolbar = WBInputToolbarView()
        toolbar.frame = CGRect(x: 0, y: self.view.height-44, width: self.view.width, height: 44)
        self.toolBar = toolbar
        
        //        self.input?.inputAccessoryView = toolbar
        
        self.view.addSubview(toolbar)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardDidShow(note:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardDidHide(note:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.input?.frame = self.inputContainer.frame
        
        self.collectionViewLayout.minimumLineSpacing = 10
        self.collectionViewLayout.minimumInteritemSpacing = 10
        self.collectionViewLayout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10)
        
        let col:CGFloat = 3
        let width = (self.collectionView.width - CGFloat((col+1) * 10))/col
        let height = width
        self.collectionViewLayout.itemSize = CGSize(width: width, height: height)
    }
    
    
    @objc private func close() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc private func compose() {
        if self.images.count == 0 {
            self.composeStatusWithoutImage()
        } else {
            self.composeStatusWithImage()
        }
    }
    
    // MARK: - compose with/without image
    private func composeStatusWithImage() {
        var parameters:[String: String?] = [:]
        parameters["access_token"] = WBAccount.accountFromSandbox()?.access_token as String??
        parameters["status"] = self.input?.text
        
        let url = "https://upload.api.weibo.com/2/statuses/upload.json"
        
//        Alamofire.request(url, method: .post, parameters: parameters).validate().responseJSON { (response) in
//            switch response.result {
//            case .success(let value):
//                printLog(message: "\(value)")
//                self.inputView?.resignFirstResponder()
//                self.dismiss(animated: true, completion: {
//                    KRProgressHUD.showSuccess(message: "发送成功")
//                })
//            case .failure(let error):
//                printLog(message: "\(error)")
//                KRProgressHUD.showError(message: "发送失败")
//            }
//        }
        
        KRProgressHUD.show(message: "Uploading...")
        
        Alamofire.upload(multipartFormData: { (multipartFormData) in
            let image = self.images[0]
            let data = UIImagePNGRepresentation(image)
            multipartFormData.append(data!, withName: "pic", fileName: "xxoo.png", mimeType: "image/png")
            
            for (key, value) in parameters {
                multipartFormData.append((value?.data(using: String.Encoding.utf8))! , withName: key)
            }
            
            }, to: url) { (encodingResult) in
                switch encodingResult {
                case .success(let upload, _, _):
                    upload.uploadProgress(closure: { (progress) in
                        printLog(message: "uploading now")
                        printLog(message: "\(progress.fractionCompleted)")
                    })
                    
                    upload.responseJSON { response in
                        switch response.result {
                        case .success(let value):
                            printLog(message: "\(value)")
                            self.inputView?.resignFirstResponder()
                            self.dismiss(animated: true, completion: {
                                KRProgressHUD.showSuccess(message: "发送成功")
                            })
                        case .failure(let error):
                            printLog(message: "\(error)")
                            KRProgressHUD.showError(message: "发送失败")
                        }
                        
                    }
                case .failure(let error):
                    printLog(message: "\(error)")
                    KRProgressHUD.showError(message: "发送失败")
                }
        }
        

    }
    
    private func composeStatusWithoutImage() {
        var parameters:[String: Any] = [:]
        parameters["access_token"] = WBAccount.accountFromSandbox()?.access_token
        parameters["status"] = self.input?.text
        let url = "https://api.weibo.com/2/statuses/update.json"
        
        Alamofire.request(url, method: .post, parameters: parameters).validate().responseJSON { (response) in
            switch response.result {
            case .success(let value):
                printLog(message: "\(value)")
                self.inputView?.resignFirstResponder()
                self.dismiss(animated: true, completion: {
                    KRProgressHUD.showSuccess(message: "发送成功")
                })
            case .failure(let error):
                printLog(message: "\(error)")
                KRProgressHUD.showError(message: "发送失败")
            }
        }
    }

    // MARK: - keyboard notification
    @objc private func keyboardDidShow(note: Notification) {
        /*
         [AnyHashable("UIKeyboardCenterBeginUserInfoKey"): NSPoint: {187.5, 796}, AnyHashable("UIKeyboardIsLocalUserInfoKey"): 1, AnyHashable("UIKeyboardCenterEndUserInfoKey"): NSPoint: {187.5, 538}, AnyHashable("UIKeyboardBoundsUserInfoKey"): NSRect: {{0, 0}, {375, 258}}, AnyHashable("UIKeyboardFrameEndUserInfoKey"): NSRect: {{0, 409}, {375, 258}}, AnyHashable("UIKeyboardAnimationCurveUserInfoKey"): 7, AnyHashable("UIKeyboardFrameBeginUserInfoKey"): NSRect: {{0, 667}, {375, 258}}, AnyHashable("UIKeyboardAnimationDurationUserInfoKey"): 0.25]
         */
        
        
        let keyboardFrame = (note.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
        
        let keyboardHeight = keyboardFrame?.height
        let animitionDuration = (note.userInfo?[UIKeyboardAnimationDurationUserInfoKey]) as! TimeInterval
        
        UIView.animate(withDuration: animitionDuration) { 
            self.toolBar?.transform = CGAffineTransform.init(translationX: 0, y: -keyboardHeight!)
        }
        
    }
    
    @objc private func keyboardDidHide(note: Notification) {
        let animitionDuration = (note.userInfo?[UIKeyboardAnimationDurationUserInfoKey]) as! TimeInterval
        
        UIView.animate(withDuration: animitionDuration) {
            self.toolBar?.transform = CGAffineTransform.identity
        }
    }
    
    // MARK: - UITextView delegate
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.view.endEditing(true)
    }
    
    func textViewDidChange(_ textView: UITextView) {
        self.navigationItem.rightBarButtonItem?.isEnabled = textView.text.characters.count > 0
    }
    
    // MARK: - collectionView delegate and datasource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.images.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! WBComposeCollectionViewCell
        cell.delegate = self
        
        if self.images.count == indexPath.item {
            cell.iconImage = nil
        } else {
            cell.iconImage = self.images[indexPath.item]
            cell.itemIndex = indexPath.item
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    
    // MARK: - WBComposeCollectionViewCellDelegate
    func composeCollectionViewCell(cell: WBComposeCollectionViewCell, addPhotoBtnClick: WBComposeCollectionViewButton) {
        
        let picker = UIImagePickerController()
        picker.delegate = self
        self.present(picker, animated: true, completion: nil)
        
    }
    
    func composeCollectionViewCell(cell: WBComposeCollectionViewCell, deletePhotoBtnClick: WBComposeCollectionViewButton) {
        self.images.remove(at: (cell.itemIndex)!)
        self.collectionView.reloadData()
    }
    
    // MARK: UIImagePickerControllerDelegate
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let image = info[UIImagePickerControllerOriginalImage]
        self.images.append(image as! UIImage)
        self.collectionView.reloadData()
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    
    // MARK:- deinital
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    
}
