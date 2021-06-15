//
//  ViewController.swift
//  Swift6Camera
//
//  Created by 田川　裕隆 on 2021/06/12.
//

import UIKit
import Photos

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var checkPermission = CheckPermission()

    @IBOutlet weak var backImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkPermission.checkCamera()
    }


    @IBAction func camera(_ sender: Any) {
        let sourceType: UIImagePickerController.SourceType = .camera
        createImagePicker(sourceType: sourceType)
        
    }
    
    
    @IBAction func alubum(_ sender: Any) {
        let sourceType: UIImagePickerController.SourceType = .photoLibrary
        createImagePicker(sourceType: sourceType)
    }
    
    
    @IBAction func share(_ sender: Any) {
        let text = ""
        let image = backImageView.image?.jpegData(compressionQuality: 0.5)
        let item = [text, image as Any]
        let activityVC = UIActivityViewController(activityItems: item, applicationActivities: nil)
        self.present(activityVC, animated: true, completion: nil)
    }
    
    func createImagePicker(sourceType: UIImagePickerController.SourceType){
        let cameraPicker = UIImagePickerController()
        cameraPicker.sourceType = sourceType
        cameraPicker.delegate = self
        cameraPicker.allowsEditing = true
        self.present(cameraPicker, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickerImage = info[.editedImage] as? UIImage{
            backImageView.image = pickerImage
            picker.dismiss(animated: true, completion: nil)
        }
    }
}
