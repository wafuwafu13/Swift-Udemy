//
//  NextViewController.swift
//  Swift6Button1
//
//  Created by 田川　裕隆 on 2021/06/08.
//

import UIKit

class NextViewController: UIViewController {
    
    var count = 0
    
    
    @IBOutlet weak var label: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        count = 5
        print(5)
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func change(_ sender: Any) {
        label.text = "Twitterのロゴです"
        label.font = UIFont.boldSystemFont(ofSize: 20)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
