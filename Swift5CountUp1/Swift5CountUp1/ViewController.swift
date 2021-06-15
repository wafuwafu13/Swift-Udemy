//
//  ViewController.swift
//  Swift5CountUp1
//
//  Created by 田川　裕隆 on 2021/06/08.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var countLabel: UILabel!
    
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        countLabel.text = "0"
    }
    
    
    @IBAction func plus(_ sender: Any) {
        count = count + 1
        countLabel.text = String(count)
        
        if count >= 10{
            changeTextColor()
        }
        
    }
    
    @IBAction func minus(_ sender: Any) {
        count = count - 1
        countLabel.text = String(count)
        
        if count <= 0{
            resetColor()
        }
    }
    
    func changeTextColor(){
        countLabel.textColor = .yellow
    }
    
    func resetColor(){
        countLabel.textColor = .white
    }
    
}

