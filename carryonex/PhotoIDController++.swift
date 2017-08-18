//
//  PhotoIDController++.swift
//  carryonex
//
//  Created by Xin Zou on 8/15/17.
//  Copyright © 2017 Xin Zou. All rights reserved.
//

import UIKit


extension PhotoIDController: UITextFieldDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    /// dismiss keyboard by tapping return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameTextField.resignFirstResponder()
        return true
    }
    
    /// response to 4 image button tapped
    func passportButtonTapped(){
        imagePickedType = ImageForIDsType.passport
        imageIDsButtonTapped()
    }
    func idCardA_ButtonTapped(){
        imagePickedType = ImageForIDsType.idCardA
        imageIDsButtonTapped()
    }
    func idCardB_ButtonTapped(){
        imagePickedType = ImageForIDsType.idCardB
        imageIDsButtonTapped()
    }
    /// allow edit as square
    func profileButtonTapped(){
        imagePickedType = ImageForIDsType.profile
        imageIDsButtonTapped()
    }
    
    
    /// open menu to select image source
    func imageIDsButtonTapped(){
        let attachmentMenu = UIAlertController(title: "选择图片来源", message: "", preferredStyle: .actionSheet)
        let openLibrary = UIAlertAction(title: "相册选择", style: .default) { (action) in
            self.openImagePickerWith(source: .photoLibrary, isAllowEditing: self.imagePickedType == ImageForIDsType.profile)
        }
        let openCamera = UIAlertAction(title: "打开相机", style: .default) { (action) in
            self.openImagePickerWith(source: .camera, isAllowEditing: self.imagePickedType == ImageForIDsType.profile)
        }
        let cancelSelect = UIAlertAction(title: "取消", style: .cancel) { (action) in
            self.dismiss(animated: true, completion: nil)
        }
        attachmentMenu.addAction(openLibrary)
        attachmentMenu.addAction(openCamera)
        attachmentMenu.addAction(cancelSelect)
        
        present(attachmentMenu, animated: true, completion: nil)
    }
    
    
    func openImagePickerWith(source: UIImagePickerControllerSourceType, isAllowEditing: Bool){
        let imgPicker = UIImagePickerController()
        imgPicker.sourceType = source
        imgPicker.allowsEditing = isAllowEditing
        imgPicker.delegate = self
        
        present(imgPicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        print(info)
        
        if let editedImg = info[UIImagePickerControllerEditedImage] as? UIImage {
            // profile image
            profileImg = editedImg
            profileButton.setImage(editedImg, for: .normal)
        }else
        if let originalImg = info[UIImagePickerControllerOriginalImage] as? UIImage {
            // passport or Id image
            guard let imagePickedType = self.imagePickedType else { return }
            let getImg = originalImg
            
            switch imagePickedType {
                
            case .passport:
                passportImg = getImg
                passportButton.setImage(getImg, for: .normal)
            case .idCardA:
                idCardA_Img = getImg
                idCardA_Button.setImage(getImg, for: .normal)
            case .idCardB:
                idCardB_Img = getImg
                idCardB_Button.setImage(getImg, for: .normal)
            case .profile:
                profileImg = getImg
                profileButton.setImage(getImg, for: .normal)
            default:
                print("\n \n --- Warning: PhotoIDController++: unknow type of image selected.")
            }
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    
}


