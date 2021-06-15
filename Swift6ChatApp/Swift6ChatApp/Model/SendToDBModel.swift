//
//  SendToDBModel.swift
//  Swift6ChatApp
//
//  Created by 田川　裕隆 on 2021/06/14.
//

import Foundation
import FirebaseStorage

protocol SendTofileOKDelegate {
    func sendProfileOKDelegate(url:String)
}

class SendToDBModel{
    
    var sendProfileOKDelegate: SendTofileOKDelegate?
    
    init(){
        
    }
    
    func sendProfileImageData(data: Data){
        let image = UIImage(data: data)
        let profileImageData = image?.jpegData(compressionQuality: 0.1)
        
        let imageRef = Storage.storage().reference().child("profileImage").child("\(UUID().uuidString + String(Date().timeIntervalSince1970)).jpg")
        
        imageRef.putData(profileImageData!, metadata: nil) { (metaData, error) in
            if error != nil{
                print(error.debugDescription)
                return
            }
        }
        
//        imageRef.downloadURL { (url, error) in
//            if error != nil{
//                print(error.debugDescription)
//                return
//            }
//
//            UserDefaults.standard.setValue(url?.absoluteString, forKey: "userImage")
//            self.sendProfileOKDelegate?.sendProfileOKDelegate(url: url!.absoluteString)
//        }
    }
}
