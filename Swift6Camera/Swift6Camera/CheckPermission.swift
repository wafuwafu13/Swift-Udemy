//
//  CheckPermission.swift
//  Swift6Camera
//
//  Created by 田川　裕隆 on 2021/06/12.
//

import Foundation
import Photos

class CheckPermission{
    func checkCamera(){
        
        PHPhotoLibrary.requestAuthorization { (status) in
            
            switch(status){
            case .authorized:
                print("authorized")
                
            case .notDetermined:
                print("notDetermined")
            case .restricted:
                print("restricted")
            case .denied:
                print("denied")
            case .limited:
                print("limited")
            @unknown default:
                break
            }
        }
    }
    
}
