//
//  ViewController.swift
//  Swift5Bokete
//
//  Created by 田川　裕隆 on 2021/06/12.
//

import UIKit
import Alamofire
import SwiftyJSON
import SDWebImage
import Photos

class ViewController: UIViewController {
    
    @IBOutlet weak var odaiImageView: UIImageView!
    
    @IBOutlet weak var commentTextView: UITextView!
    
    @IBOutlet weak var searchTextField: UITextField!

    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        commentTextView.layer.cornerRadius = 20.0
        
        PHPhotoLibrary.requestAuthorization { (status) in
            switch(status){
            case .authorized: break
            case .denied: break
            case .notDetermined: break
            case .restricted: break
            case .limited: break
            @unknown default: break
            }
        }
        
        getImages(keyword: "funny")
    }
    
    func getImages(keyword:String){
        // APIKEY 22043798-c0fc316685fddd40eda7d3430
        let url = "https://pixabay.com/api/?key=22043798-c0fc316685fddd40eda7d3430&q=\(keyword)"
        
        AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default).responseJSON{
            (response) in
            switch response.result{
            case .success:
                let json:JSON = JSON(response.data as Any)
                var imageString = json["hits"][self.count]["webformatURL"].string
                
                if imageString == nil{
                    imageString = json["hits"][0]["webformatURL"].string
                    self.odaiImageView.sd_setImage(with: URL(string: imageString!), completed: nil)
                }else{
                    self.odaiImageView.sd_setImage(with: URL(string: imageString!), completed: nil)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    @IBAction func nextOdai(_ sender: Any) {
        count = count + 1
        
        if searchTextField.text == ""{
            getImages(keyword: "funny")
        }else{
            getImages(keyword: searchTextField.text!)
        }
    }
    
    @IBAction func searchAction(_ sender: Any) {
        self.count = 0
        
        if searchTextField.text == ""{
            getImages(keyword: "funny")
        }else{
            getImages(keyword: searchTextField.text!)
        }
    }
    
    @IBAction func next(_ sender: Any) {
        performSegue(withIdentifier: "next", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let shareVC = segue.destination as? ShareViewController
        shareVC?.commentString = commentTextView.text
        shareVC?.resultImage = odaiImageView.image!
    }
}

