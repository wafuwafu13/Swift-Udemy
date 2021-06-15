//
//  ViewController.swift
//  Swift5Senni
//
//  Created by 田川　裕隆 on 2021/06/10.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func plus(_ sender: Any) {
        count = count + 1
        
        label.text = String(count)
        
        if count == 10{
            
            //count = 0
            
//            performSegue(withIdentifier: "next", sender: nil)
            //let nextVC = segue.destination as! NextViewController
            let nextVC = storyboard?.instantiateViewController(identifier: "next") as! NextViewController
            
            navigationController?.pushViewController(nextVC, animated: true)
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextVC = segue.destination as! NextViewController
        nextVC.count2 = count
    }
}
